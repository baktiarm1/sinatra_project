class JournalController < ApplicationController

  # get '/journal_entries' do
  #
  #   if Helpers.is_logged_in?
  #     @user = current_user
  #     erb :"journal/journal_entries"
  #   else
  #     flash[:login] = "You need to be logged in to get to this page"
  #     redirect to '/login'
  #   end
  # end

  get '/journal_entries' do
    erb :"journal/journal_entries"
  end

  get '/create_journal_entry' do
    erb :"journal/create_journal_entry"
  end

  post '/show_entry' do
    @entry = Entry.create(:country => params["country"], :content => params["content"])

    redirect to erb :'/journal/show_entry'
  end



end
