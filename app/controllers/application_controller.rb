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
         redirect to '/journal_entries'
     end

     erb :"/users/create_user"
  end

  post '/signup' do
    params.each do |label, input|
      if input.empty?
        flash[:new_user_error] = "Please enter a value for #{label}"
        redirect to '/signup'
      end
    end

    user = User.create(:username => params["username"], :email => params["email"], :password => params["password"])
    session[:user_id] = user.id

    redirect to '/journal_entries'
  end

  get '/login' do
      if Helpers.is_logged_in?(session)
        redirect to '/journal_entries'
      end

      erb :"/users/login"
    end


    post '/login' do
        user = User.find_by(:username => params["username"])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to '/journal_entries'
        else
          flash[:login_error] = "Incorrect login. Please try again."
          redirect to '/login'
        end
      end

    get '/logout' do
        if Helpers.is_logged_in?(session)
          session.clear
          redirect to '/login'
        else
          redirect to '/'
        end
      end


end
