class MensajeriaController < ApplicationController

  def create
    peticion = Peticion.find(params[:peticion_id])

    if params[:tipo] === 'general'
      resultado='Mensajes enviados'
      ok=true
      intercesores=Intercesor.where(peticion_id: peticion.id)
      intercesores.each do |inter|
         mensaje = Mensaje.new(encabezado: params[:encabezado], contenido: params[:contenido], destinatario_id: inter.usuario_id, usuario_id: peticion.usuario_id ,peticion_id: peticion.id)
         ok = ok &&  mensaje.save  

         if ok 
          render json: {status: 200, mensaje: resultado}
        else
          render json: {status: 500, resultado: "Problemas enviando todos los mensajes"}
        end
      end

    else
      mensaje = Mensaje.new(encabezado: params[:encabezado], contenido: params[:contenido], usuario_id: params[:usuario_id], peticion_id: peticion.id, destinatario_id: peticion.usuario_id)
      if mensaje.save
        render json: {status: 200, resultado: mensaje}
      else
        render json: {status: 500, resultado: mensaje.errors}
      end
    end
  end

  def show
    ap "Listar" 
    ap params[:tipo]
    render json:  Mensaje.where(usuario_id: params[:usuario_id]).order(created_at: :desc) if params[:tipo] =='enviados'
    render json:  Mensaje.where(destinatario_id:  params[:usuario_id]).order(created_at: :desc) if params[:tipo] =='recibidos'
  end


end