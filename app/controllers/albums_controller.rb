class AlbumsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  
  # this is the list of all albums for a specific user
  # accessible by everyone
  def index
    @user = User.find(params[:id])
    raise "not found" if @user.blank?  
      @albums = @user.albums.all(:order => :title)
    rescue
      redirect_to root_url, :notice => "Can't find this user."
  end
  
  # show album details
  # added exception if album is not found (although this should not happen)
  def show
    @album = Album.find(params[:id])
    raise "not found" if @album.blank?  
      @tracks = @album.tracks.all(:order => :tracknumber)
      @cover = @album.covers.first
      @comments = @album.comments.all(:order => :posted)
    rescue
      redirect_to artists_url, :notice => "Can't find this album."
  end
  
  # create a new album for this user
  def new
    if !@artist
      @artist = current_user.artists.find(params[:id])
    end
    @album = Album.new
  end
  
  def create
    @album = current_user.albums.new(params[:album])
    if @album.save
      redirect_to "/artists/" + params[:album][:artist_id], :notice => "Successfully created album."
    else
      @artist = current_user.artists.find(params[:album][:artist_id])
      render :action => 'new'
    end
  end
end
