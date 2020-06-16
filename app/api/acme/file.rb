
module Acme
  class File < Grape::API
    desc 'Returns pong.'
    get :file do
      { ping: params[:pong] || 'pong' }
    end
    
    desc 'create a new log'
    params do
      requires :name, type: String
    end

    params do
     requires :name, type: String, allow_blank: false
     requires :phash, type: String, allow_blank: false
   #  requires :screenshots, :type => Rack::Multipart::UploadedFile, allow_blank: true
     requires :files, :type => Rack::Multipart::UploadedFile, allow_blank: true 
    end

    post :file do
   	log = Log.create
	log.name = params[:name]
	p = Player.find_by phash: params[:phash]
	log.player = p
	log.files = [params[:files][:tempfile]]
	log.save		            # Do whatever you need with this file. 
			    #         # Here, you can store it in the server filesystem or in your database.
			    #             end
	    #Log.create!({ name:params[:name], player_id:params[:player_id] })
    end
end
end
