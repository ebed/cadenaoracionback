class Usuario < ApplicationRecord
  has_many :peticions
  has_many :intercesors
  has_many :mensajes

  validates_presence_of  :email, :password_digest
  validates :email, uniqueness: true
#  has_attached_file :image
  has_secure_password



#  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
