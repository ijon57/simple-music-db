class AlbumsController < ApplicationController
  before_filter :require_user
  before_filter :find_object, :only => [:show, :edit, :update, :destroy]

  def index
    @albums = current_user.albums
  end
  
  def new
    @album = current_user.albums.new
  end
  
  def create
    @album = current_user.albums.build(params[:album])
    if @album.save
      redirect_to user_albums_path, :notice => 'Album created successfully!'
    else
      render :action => :new
    end
  end

  def update
    if @album.update_attributes(params[:album])
      redirect_to user_albums_path, :notice => 'Album updated successfully!'
    else
      render :action => :edit
    end
  end
    
  def search
    query = params[:query]
    @albums = current_user.albums.where('title LIKE ? OR artist LIKE ?', query, query)
  end
  
  private
  
  def find_object
    @album = current_user.albums.find(params[:id])
  end
  
end
