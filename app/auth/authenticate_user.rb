# app/auth/authenticate_user.rb
class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email, :password

  #this is where parameters are taken when the command is called
  def initialize(email, password)
    @email = email
    @password = password
  end
  
  #this is where the result gets returned
  def call
    ap "Llamando a Authentica User"
    JsonWebToken.encode(usuario_id: usuario.id) if usuario
  end

  private

  def usuario
    usuario = Usuario.find_by_email(email)
    return usuario if usuario && usuario.authenticate(password)

    errors.add :usuario_authentication, 'Invalid credentials'
    nil
  end
end