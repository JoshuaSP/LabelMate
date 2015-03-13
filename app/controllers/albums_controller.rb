class AlbumsController < ApplicationController
  before_action :find_by_id, only: [:destroy, :edit, :show, :update]

  def create
    @album = Album.new(album_params)
    if @album.save
      flash.now[:messages] = "You have successfully generated an album."
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def new
    @album = Album.new
    @album.band_id = params[:band_id]
  end

  def edit
  end

  def show
  end

  def update
    if @album.update(album_params)
      flash[:messages] = ["Album Updated!"]
      redirect_to @album
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @album.destroy
      flash[:messages] = ["Album Deleted!"]
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :show
    end
  end

  private

  def find_by_id
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :band_id, :live_album)
  end
end
