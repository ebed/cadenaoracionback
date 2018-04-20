class TiposController < ApplicationController
  def show
    render json: Tipo.all
  end
end
