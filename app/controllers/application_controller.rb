class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_usuario

    include ExceptionHandler


    private
    def authenticate_request
      ap "en app controller"
      @current_usuario = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_usuario
    end
end
