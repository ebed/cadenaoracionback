class CreateUsuarioImages < ActiveRecord::Migration[5.1]
  def self.up
    create_table :images do |t|
      t.integer    :usuario_id
      t.string     :style
      t.binary     :file_contents
    end
  end

  def self.down
    drop_table :images
  end
end
