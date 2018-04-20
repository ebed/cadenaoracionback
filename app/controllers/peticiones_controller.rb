class PeticionesController < ApplicationController
  def show

    resultado = Peticion.listar(usuario_id: params[:usuario_id], tipo: params[:tipo])
    render json: resultado
  end

  def create
    p "llamando a creacion"
    p params
    p = Peticion.new(peticion_params)
    if p.save
      render json: p 
    else
      render json: p.errors
    end
  end



  private 
  def peticion_params
    params.permit(:titulo, :tipo_id, :usuario_id, :estado_id, :descripcion)
  end

end
