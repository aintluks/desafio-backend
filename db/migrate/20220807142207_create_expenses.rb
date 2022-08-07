class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.references :deputy, null: false, foreign_key: true
      t.string :dat_emissao
      t.string :txt_fornecedor
      t.string :vlr_liquido
      t.string :num_mes
      t.string :num_ano
      t.string :url_documento

      t.timestamps
    end
  end
end
