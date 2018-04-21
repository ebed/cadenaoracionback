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
      render json: {status: 200, data: p} 
    else
      render json:  {status: 500, message: p.errors}
    end
  end

  def update
    ap "En update"

  end


  def cancela
    ap "Cancelando"
    ap params[:id]
    peticion = Peticion.find(params[:id])
    peticion.estado_id = 3 
    if peticion.save
      render json: {status: 200}
    else
      render json: {status: 500, errors: peticion.errors}

    end
  end

  def finaliza
    ap "Finalizando"
    ap params[:id]
    peticion = Peticion.find(params[:id])
    peticion.estado_id = 2
    if peticion.save
      render json: {status: 200}
    else
      render json: {status: 500, errors: peticion.errors}

    end
  
  end


  def cancelaintercesion
    ap "Cancelando intercesion"
    ap params[:usuario_id]
    ap params[:peticion_id]
    if Intercesor.where(usuario_id: params[:usuario_id], peticion_id: params[:id]).delete_all 
      render json: {status: 200}
    else
      render json: {status: 500}
    end

  end


  private 
  def peticion_params
    params.permit(:titulo, :tipo_id, :usuario_id, :estado_id, :descripcion)
  end

end
