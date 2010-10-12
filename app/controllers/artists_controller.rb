class ArtistsController < ApplicationController
  before_filter :require_user

  # view your personal list of artists
  # displays a link to add a new artist
  def index
    @artists = current_user.artists.all
  end
  
  # shows artist details and list of albums
  # displays a link to create a new album
  def show
    @artist = current_user.artists.find(params[:id])
    raise "not found" if @artist.blank?
      @albums = @artist.albums.all
    rescue
      redirect_to artists_url, :notice => "Can't find this artist."
  end
  
  def new
    @artist = current_user.artists.new
  end
  
  def create
    @artist = current_user.artists.new(params[:artist])
    if @artist.save
      redirect_to artists_url, :notice => "Successfully created artist."
    else
      render :action => 'new'
    end
  end
end
