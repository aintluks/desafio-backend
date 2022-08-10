class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.references :deputy, null: false, foreign_key: true
      t.datetime :dat_emissao
      t.string :txt_fornecedor
      t.decimal :vlr_liquido, precision: 8, scale: 2
      t.string :url_documento

      t.timestamps
    end
  end
end
