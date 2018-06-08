class MensajeriaController < ApplicationController

  def create
    ap "Creando"
    mensaje = Mensaje.new(encabezado: params[:encabezado], contenido: params[:contenido], usuario_id: params[:usuario_id], peticion_id: params[:peticion_id])
    if mensaje.save
      render json: {status: 200, resultado: mensaje}
    else
      render json: {status: 500, resultado: mensaje.errors}
    end
  end

  def show
    ap "Listar" 
    ap params[:tipo]
    render json:  Mensaje.where(usuario_id: params[:usuario_id]) if params[:tipo] =='enviados'
    render json:  Mensaje.joins(:peticion).where(peticion: [usuario_id: params[:usuario_id]]) if params[:tipo] =='recibidos'
  end


end