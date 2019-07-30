
require 'gossip'

class ApplicationController < Sinatra::Base

	get '/' do
 		erb :index, locals: {gossip: Gossip.all}
 	end

 	get '/gossip/new/' do
 		erb :new_gossip
 	end

	post '/gossip/new/' do
  	Gossip.new(params["gossip_author"],params["gossip_content"]).save
  		 redirect '/'
	 
	end
	post '/gossip/new/' do
  		puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
	end
	get '/gossip/:id' do
		erb :show,locals: {gossip:Gossip.find(params[:id])}
	end


	get '/gossip/edit/:id' do
		erb :edit_gossip
	end
	
	 get '/gossip/edit/:id' do
	 	Gossip.edit(params[:id],params['gossip_content'] , params['gossip_author'])
	 redirect '/gossips/:id'
	
	 end
end