
module Acme
  class Report < Grape::API
    desc 'Returns pong.'
    get :report do
      { ping: params[:pong] || 'pong' }
    end
    
    desc 'create a new log'
    params do
      requires :name, type: String
    end

    params do
     requires :name, type: String, allow_blank: false
     requires :player_id, type: Integer, allow_blank: false
     requires :screenshots, :type => Rack::Multipart::UploadedFile 
     requires :files, :type => Rack::Multipart::UploadedFile 
    end

    post :report do
#	params.pry
   	log = Log.create
	log.name = params[:name]
	log.player_id = params[:player_id]
	log.screenshots = [params[:screenshots][:tempfile]]
	log.files = [params[:files][:tempfile]]
	log.save		            # Do whatever you need with this file. 
			    #         # Here, you can store it in the server filesystem or in your database.
			    #             end
	    #Log.create!({ name:params[:name], player_id:params[:player_id] })
	    #Log.create!({ name :params[:name], player_id :params[:player_id], screenshot :params[:screenshot] }) 
    end

  end
end
