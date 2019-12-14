require './config/environment'
require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
 enable :sessions
 use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
   
    set :session_secret, 'baktiarmiah'
  end

    get '/' do 
        erb :index
    end 

  get '/signup' do 
     if Helpers.is_logged_in?(session)
         redirect to '/journal'
     end 

     erb :"/users/create_user"
  end 



end