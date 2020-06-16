
module Acme
  class Screenshot < Grape::API
    desc 'Returns pong.'
    get :screenshot do
      { ping: params[:pong] || 'pong' }
    end
    
    desc 'create a new log'
    params do
      requires :name, type: String
    end

    params do
     requires :name, type: String, allow_blank: false
     requires :phash, type: String, allow_blank: false
     requires :screenshots, :type => Rack::Multipart::UploadedFile
    end

    post :screenshot do
   	log = Log.create
	log.name = params[:name]
	p = Player.find_by phash: params[:phash]
	log.player = p
	log.screenshots = [params[:screenshots][:tempfile]]
	log.save		            # Do whatever you need with this file. 
    end


  end
end
