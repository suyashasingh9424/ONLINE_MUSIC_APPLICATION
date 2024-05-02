class MusicsController < ApplicationController
  before_action :authenticate_user!, except: [:music_library, :search]
    def new
      @music = Music.new
    end
  
    def create
      @music = Music.new(music_params)
      if @music.save
        redirect_to musics_path, notice: 'Music added successfully.'
      else
        render :new
      end
    end

    def index
      @musics = Music.all
    end

    def music_library

      @musics = Music.all
  
    end
  

    def search

      @musics = Music.includes(:artist).where("LOWER(musics.title) LIKE ? OR LOWER(artists.name) LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
  
      @musics = @musics.references(:artist)
  
    end
    private
  
    def music_params
        params.require(:music).permit(:title, :duration, :artist_id, :audio_file)
    end
      
end
  