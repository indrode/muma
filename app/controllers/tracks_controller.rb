class TracksController < ApplicationController
  before_filter :require_user
  
  # add a new track for the selected album
  # make sure to allow adding tracks for your albums only 
  def new
    if !@album
      @album = current_user.albums.find(params[:id])
    end
    @track = Track.new
  end
  
  # create a new track and return to album detail page
  def create
    @track = Track.new(params[:track])
    if @track.save
      redirect_to "/albums/" + params[:track][:album_id], :notice => "Successfully created track."
    else
      # render new again and display error messages
      @album = current_user.albums.find(params[:track][:album_id])
      render :action => 'new'
    end
  end
end
