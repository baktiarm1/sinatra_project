class JournalController < ApplicationController

  # get '/journal_entries' do
  
  #   if Helpers.is_logged_in?(session)
  #     # user = current_user
  #     erb :"journal/index_entries"
  #   else
  #     flash[:login] = "You need to be logged in to get to this page"
  #     redirect to '/login'
  #   end
  # end


  post '/show_entry' do 
    entries = Entry.new(:country => params["country"], :content => params["content"])
    entries.save
    # @entries = Entry.all
    erb :"journal/show_entry"
  end 

 

  # get 'user/journal_entries' do 
  #   @entries = current_user.entries
  #   erb :'journal/index_entries'
  # end 

  

  get '/new_entry' do
    erb :"journal/new_entry"
  end

 
   get '/journal_entries' do
    @entries = Entry.all
    erb :"journal/index_entries"
  end

  post '/journal_entries' do
     #@entries = Entry.create(params)
    entries = Entry.new(:country => params["country"], :content => params["content"])
    #@entries = current_user.entries.build(:country => params[:country],  :content => params[:content])
    entries.save
    # @entries = Entry.all
    redirect to "/journal_entries"
  end

  get 'journal_entries/:id' do 
    
   @entries = Entry.find_by(params[:id])
    erb :'journal/show_entry'
  end 

  get 'journal_entries/:id/edit' do 
    @entries = Entry.find_by_id(params[:id])
      if @entries.user != current_user
        redirect to '/'
      else 
        erb :'journal/edit_entry'
      end 
    end 

   patch 'journal_entries/:id' do 
    @entries = Entry.find_by_id(params[:id])
      if @entries.user != current_user
        redirect to "/"
      else 
        @entries.country = params[:title]
        @entries.content = params[:content]
        @entries.save
        redirect to "journal_entries/#{@entries.id}"
      end 
    end 

    delete 'journal_entries/:id' do 
      @entries = Entry.find_by_id(params[:id])
      if @entries.user != current_user
        redirect to '/'
      else 
        @entry.delete
        redirect to "/journal_entries"
      end 
    end 

  private

  def set_entry
    @entries = Entry.find_by(params[:id])
    # unless @entries 
    #   puts "#{params[:id] is not valid post"
    #   redirect '/'
    # end 
  end 

end 