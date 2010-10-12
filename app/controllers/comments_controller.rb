class CommentsController < ApplicationController
  
  # unauthorized users post comments as "anonymous"
  def new
    # set author to anonymous if not logged in
    @author = (current_user ? current_user.login : "anonymous")
    if !@album
      @album = Album.find(params[:id])
    end
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to "/albums/" + params[:comment][:album_id], :notice => "Successfully created comment."
    else
      # need to set author again to render new
      @author = (current_user ? current_user.login : "anonymous")
      @album = Album.find(params[:comment][:album_id])
      render :action => 'new'
    end
  end
end