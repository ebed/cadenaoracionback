class CreatePeticions < ActiveRecord::Migration[5.1]
  def change
    create_table :peticions do |t|
      t.string :titulo
      t.integer :estado_id
      t.integer :tipo_id
      t.integer :usuario_id
      t.string :descripcion

      t.timestamps
    end
  end
end
