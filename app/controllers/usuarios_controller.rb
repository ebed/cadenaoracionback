class UsuariosController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]
  def show 
    if params[:id]
      usuario = Usuario.find(params[:id])
      render json: {status: 200, usuario: usuario}
    else
      render json: {status: 500, message: "No hay dato para mostrar"}

    end
  end


  def update
    if Usuario.find(params[:id]).update(user_params)
      render json: {status: 200}
    else
      render json: {status: 500}
    end

  end

  def changeavatar
    ap "Cambiando imagen"
    usuario=Usuario.find(params[:usuario]) 
   # usuario.image = params[:image]  
    result = Cloudinary::Uploader.upload(params[:image], upload_preset: 'kmaftbcj')
    ap result["url"]
    usuario.avatar = result["url"]

    if usuario.save
     render json: {status: 200, resultado: usuario}
    else
      render json: {status: 500, mensajes: usuario.errors}
    end
    
  end


  def create

  end


   # POST /register
  def register
    @usuario = Usuario.new(user_params)
   if @usuario.save
    response = { message: 'usuario creado successfully'}
    render json: {status: 200, message: "Usuario creado exitosamente!"},  status: :created 
   else
    ap "error "
    ap @usuario.errors.messages
    render json: @usuario.errors, status: :bad
   end 
  end

  def login
    authenticate params[:email], params[:password]
  end


  private

  def user_params
    params.permit(
      :nombre,
      :apellido,
      :username,
      :email,
      :password,
      :image
    )
  end

  def usuario_params
    params.require(:usuario).permit(
      :nombre,
      :apellido,
      :username,
      :email,
      :password,
      :image
    )
  end


  def authenticate(email, password)
    ap "Autenticate"
    command = AuthenticateUser.call(email, password)

    if command.success?
      render json: {
        access_token: command.result,
        usuario: Usuario.find_by_email(email),
        message: 'Login Successful'
      }
    else
      ap "Problemas autenticando"
      render json: { error: command.errors }, status: :unauthorized
    end
   end

end