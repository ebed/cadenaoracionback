class Peticion < ApplicationRecord
  belongs_to :estado
  belongs_to :tipo
  belongs_to :usuario
  has_many :intercesors 



  def self.listar(*args)

    p "Args recupedos #{args}"
    options = args.extract_options!
    p "optiones recuperadas #{options}"
    listado = self.all 

    ap options[:tipo]
    ap options[:tipo] == 'solicitudes'
    if options[:tipo].present? 
      listado=listado.where(estado_id: 1) if options[:tipo] == 'totalpendientes'
      
      if options[:tipo] == 'peticiones' 
        listado=listado.where(estado_id: 1).joins(:intercesors).where(intercesors: {usuario_id: options[:usuario_id]})
      end
     
      listado=listado.where(usuario_id: options[:usuario_id]) if options[:usuario_id].present? &&  options[:tipo] == 'solicitudes'
    end
    
    resultado = []
    listado.each do |peticion|
      pet = {
        id: peticion.id,
        titulo: peticion.titulo,
        descripcion: peticion.descripcion,
        usuario: peticion.usuario.nombre,
        estado: peticion.estado.nombre,
        tipo: peticion.tipo.nombre,
        fechacreacion: peticion.created_at
      }
      resultado.push pet
    end

    resultado
  end
end
