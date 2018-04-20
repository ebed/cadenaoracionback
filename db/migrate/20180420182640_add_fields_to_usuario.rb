class AddFieldsToUsuario < ActiveRecord::Migration[5.1]
  def change
    add_column :usuarios, :password_digest, :string
    add_column :usuarios, :apellido, :string 
    add_column :usuarios, :username, :string 
    add_column :usuarios, :email, :string 

  end
end
