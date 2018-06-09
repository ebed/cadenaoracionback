class AddEstadoMensaje < ActiveRecord::Migration[5.1]
  def change
    add_column :mensajes, :estado, :boolean, default: :false
  end
end
