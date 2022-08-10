class CreateDeputies < ActiveRecord::Migration[6.0]
  def change
    create_table :deputies do |t|
      t.string :tx_nome_parlamentar
      t.string :ide_cadastro
      t.string :foto
      t.string :sg_uf
      t.string :sg_partido

      t.timestamps
    end
  end
end
