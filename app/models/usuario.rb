class Usuario < ApplicationRecord
  has_many :peticions
  has_many :intercesors

  validates_presence_of  :email, :password_digest
  validates :email, uniqueness: true

  has_secure_password
end
