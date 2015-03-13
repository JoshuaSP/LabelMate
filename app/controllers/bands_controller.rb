class BandsController < ApplicationController
  before_action :find_by_id, only: [:destroy, :edit, :show, :update]

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash.now[:messages] = ["You have successfully generated a band."]
      redirect_to bands_url 
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
  end

  def edit
  end

  def show
  end

  def update
    if @band.update(band_params)
      flash[:messages] = ["Band Updated!"]
      redirect_to @band
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @band.destroy
      flash[:messages] = ["Band Deleted!"]
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :show
    end
  end

  private

  def find_by_id
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
