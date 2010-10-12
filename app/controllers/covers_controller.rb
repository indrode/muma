class CoversController < ApplicationController
  before_filter :require_user

  # either add a new cover or edit the existing one
  def edit
    @album = current_user.albums.find(params[:id])
    @cover = @album.covers.first
    
    if @cover.nil?
      @cover = Cover.new
    end      
  end
  
  # only allow updating your own albums
  def update
    @album = current_user.albums.find(params[:cover][:album_id])
    @cover = @album.covers.first
    if @cover.update_attributes(params[:cover])
      redirect_to "/albums/" + params[:cover][:album_id], :notice => "Successfully changed cover."    
    else
      @album = current_user.albums.find(params[:cover][:album_id])
      render :action => 'edit'
    end
  end
  
  # create a new album cover
  def create
    @album = current_user.albums.find(params[:cover][:album_id])
    @cover = Cover.new(params[:cover])
    if @cover.save
      redirect_to "/albums/" + params[:cover][:album_id], :notice => "Successfully added cover."
    else
      @album = current_user.albums.find(params[:cover][:album_id])
      render :action => 'edit'
    end    
  end
end