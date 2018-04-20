class CreateIntercesors < ActiveRecord::Migration[5.1]
  def change
    create_table :intercesors do |t|
      t.integer :peticion_id
      t.integer :usuario_id

      t.timestamps
    end
  end
end
