module Api
  module V1
    class LogsController < ApiController

def create
   @log = Log.new(log_params)
   if @log.save
     render json: {msg: ' The image is successfully uploaded!!'}             
   else
     render json: {user: @log.errors},status:unprocessable_entity        
   end
 end
    end
  end
end
