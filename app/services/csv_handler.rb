require 'csv'

class CsvHandler
  def initialize(csv)
    @csv = csv
  end

  def self.perform(csv:)
    new(csv).perform
  end

  def perform
    CSV.foreach(@csv, liberal_parsing: true, headers: true) do |row|
      row = row.first[1].split(";")
      sg_uf = row[5].gsub!('"', '')

      if sg_uf == "PI"
        tx_nome_parlamentar = row[0].gsub!('"', '')
        cpf = row[1].gsub!('"', '')
        ide_cadastro = row[2].gsub!('"', '')
        dat_emissao = row[16].gsub!('"', '')
        txt_fornecedor = row[12].gsub!('"', '')
        vlr_liquido = row[19].gsub!('"', '')
        url_documento = row[30].gsub!('"', '')
        foto = "http://www.camara.leg.br/internet/deputado/bandep/#{ide_cadastro}.jpg"
      end
    end
  end
end