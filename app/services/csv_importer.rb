require 'csv'

class CsvImporter
  def initialize(csv)
    @csv = csv
    @state = "PI"
    @deputy_fields = {}
    @expenses_fields = {}
  end

  def self.perform(csv)
    new(csv).perform
  end

  def perform
    CSV.foreach(@csv, liberal_parsing: true, headers: true, col_sep: ";") do |row|
      row['sgUF'] == @state ? deputy_fields(row) && expenses_fields(row) && populate : next
    end
  end

  private

  def populate
    deputy = Deputy.find_or_create_by!(@deputy_fields)
    deputy.expenses.create!(@expenses_fields)
  end

  def deputy_fields(row)
    @deputy_fields[:tx_nome_parlamentar] = row["﻿\"txNomeParlamentar\""] || row[0]
    @deputy_fields[:ide_cadastro] = row['ideCadastro']
    @deputy_fields[:sg_uf] = row['sgUF']
    @deputy_fields[:sg_partido] = row['sgPartido']
    @deputy_fields[:foto] = "http://www.camara.leg.br/internet/deputado/bandep/#{row['ideCadastro']}.jpg"
  end

  def expenses_fields(row)
    @expenses_fields[:dat_emissao] = row['datEmissao'].to_time if row['datEmissao']
    @expenses_fields[:txt_fornecedor] = row['txtFornecedor']
    @expenses_fields[:vlr_liquido] = row['vlrLiquido']
    @expenses_fields[:url_documento] = row['urlDocumento']
  end
end