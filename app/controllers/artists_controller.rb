class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path, notice: 'Artist added successfully.'
    else
      render :new
    end
  end

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def follow
    @artist = Artist.find(params[:id])
  end
  
  private
  
  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
  