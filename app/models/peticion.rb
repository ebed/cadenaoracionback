class Peticion < ApplicationRecord
  belongs_to :estado
  belongs_to :tipo
  belongs_to :usuario
  has_many :intercesors 
  has_many :mensajes



  def self.listar(*args)

    
    options = args.extract_options! 
    listado = self.all 

    ap options[:tipo]
    ap "Usuario #{options[:usuario_id]}"
    
    if options[:tipo].present? 
      if options[:tipo] == 'totalpendientes'
        listado=listado.where(estado_id: 1)
        peticiones_id=Intercesor.where(usuario_id: options[:usuario_id]).pluck(:peticion_id)
        ap peticiones_id
        ap listado.count
        listado = listado.where.not(id: peticiones_id, usuario_id: options[:usuario_id])
        ap listado.count
      end

      
      if options[:tipo] == 'solicitudes' 
        ap "Solicitudes"
        listado=listado.where(estado_id: 1).joins(:intercesors).where(intercesors: {usuario_id: options[:usuario_id]})
      end
     
      listado=listado.where(usuario_id: options[:usuario_id]).where('estado_id in (1)') if options[:usuario_id].present? &&  options[:tipo] == 'peticiones'
    end
    
    resultado = []
    listado.each do |peticion|
      pet = {
        id: peticion.id,
        titulo: peticion.titulo,
        descripcion: peticion.descripcion,
        usuario: peticion.usuario.nombre,
        avatar: peticion.usuario.avatar,
        estado: peticion.estado.nombre,
        tipo: peticion.tipo.nombre, 
        fechacreacion: peticion.created_at
      }
      resultado.push pet
    end

    resultado
  end
end
