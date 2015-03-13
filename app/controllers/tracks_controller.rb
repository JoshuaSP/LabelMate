class TracksController < ApplicationController
  before_action :find_by_id, only: [:edit, :show, :update, :destroy]

  def create
    @track = Track.new(track_params)
    @track
    if @track.save
      flash.now[:messages] = "You have successfully generated a track."
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def new
    @track = Track.new
    @track.album_id = params[:album_id]
  end

  def edit
  end

  def show
  end

  def update
    if @track.update(track_params)
      flash[:messages] = ["Track Updated!"]
      redirect_to @track
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @track.destroy
      flash[:messages] = ["Track Deleted!"]
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :show
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :bonus_track, :lyrics)
  end

  def find_by_id
    @track = Track.find(params[:id])
  end
end
