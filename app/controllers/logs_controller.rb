class LogsController < ApplicationController
  def index
  end

  def create
   @log = Log.new(log_params)
   if @user.save
     render json: { result: true, msg: ' The image is sucessfully         uploaded!!'}, status: :created
    else
      render json: {result: false, user: @user.errors }, status:          :unprocessable_entity
    end
  end
end
