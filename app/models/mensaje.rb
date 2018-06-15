class Mensaje < ApplicationRecord
  belongs_to :usuario 
  belongs_to :peticion

  def self.listarRecibidos(usuario_id)
    resultado=[]
    mensajes = Mensaje.where(destinatario_id: usuario_id).order(:estado).order(created_at: :desc)

    mensajes.each do |mensaje|

      temp = {
        id: mensaje.id,
        encabezado: mensaje.encabezado,
        contenido: mensaje.contenido,
        peticion_id: mensaje.peticion_id,
        usuario_id: mensaje.usuario_id,
        peticion: mensaje.peticion.titulo,
        fecha: mensaje.created_at,
        leido: mensaje.estado
      }

      resultado.push temp

    end

    resultado
  end


  def self.listarMensajesPeticion(peticion_id)
    resultado = []
    mensajes = Mensaje.where(peticion_id: peticion_id).order(:estado).order(created_at: :desc)

    mensajes.each do |mensaje|

      temp = {
        id: mensaje.id,
        encabezado: mensaje.encabezado,
        contenido: mensaje.contenido,
        peticion_id: mensaje.peticion_id,
        usuario: mensaje.usuario.username,
        usuario_id: mensaje.usuario_id,
        peticion: mensaje.peticion.titulo,
        fecha: mensaje.created_at,
        leido: mensaje.estado
      }

      resultado.push temp
    end
    resultado
  end



    

  def self.listarPeticion(usuario_id)
    resultado = []
    iniciativas = Mensaje.where(destinatario_id: usuario_id).group(:peticion_id).count
    peticiones = Peticion.where(id: iniciativas.keys)

    peticiones.each do |pet|

      temp = {
        id: pet.id,
        cantidad_mensajes: iniciativas[pet.id],
        titulo: pet.titulo
      }
      resultado.push temp
    end
    resultado
  end



end
