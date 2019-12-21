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

end
