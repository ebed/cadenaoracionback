class AddDestinatarioMensajes < ActiveRecord::Migration[5.1]
  def change
    add_column :mensajes, :destinatario_id, :integer
    
  end
end
