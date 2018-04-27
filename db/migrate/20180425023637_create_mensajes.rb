class CreateMensajes < ActiveRecord::Migration[5.1]
  def change
    create_table :mensajes do |t|
      t.integer :peticion_id
      t.integer :usuario_id
      t.string :encabezado
      t.string :contenido

      t.timestamps
    end
  end
end
