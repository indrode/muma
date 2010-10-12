class UsersController < ApplicationController
  
  # this is the home page
  def index
    #@users = User.all
  end
  
  # this is the list of all users
  def list
    @user = User.all(:order => :login)  # sort by login name
  end
  
  def new
    @user = User.new
  end
  
  # create a new user
  def create
    @user = User.new(params[:user])
    if @user.save
      #flash[:notice] = "Successfully created user."
      redirect_to root_url, :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end
  
  # search for albums using sphinx
  def search_album
    term = params[:search_album][:term].strip # remove trailing spaces
    unless term.empty?
      @term = term
      #logger.debug "searching for: " + @term
      @albums = Album.search @term
      render "/searches/album_results"  
    else
      redirect_to root_url, :notice => "You must enter a search term."
    end
  end
  
  # search for tracks using sphinx
  def search_track
    term = params[:search_track][:term].strip # remove trailing spaces
    unless term.empty?
      @term = term
      #logger.debug "searching for: " + @term
      @tracks = Track.search @term  
      render "/searches/track_results"
    else
      redirect_to root_url, :notice => "You must enter a search term."
    end
  end
end