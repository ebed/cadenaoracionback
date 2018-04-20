class IntercedersController < ApplicationController

  def create
    ap "Creando intercesion"
    intercesion = Intercesor.new(usuario_id: params[:usuario_id], peticion_id: params[:peticion_id])
    if intercesion.save
      render json: {status: 200}
    else
      render json:  {status: 300, message: intercesion.errors}
    end
  end



end