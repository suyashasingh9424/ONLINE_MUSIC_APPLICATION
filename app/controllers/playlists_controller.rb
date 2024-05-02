class PlaylistsController < ApplicationController
    def index
        @playlists = Playlist.all
      end
      
    def new
      @playlist = Playlist.new
    end

    def create
      @playlist = Playlist.new(playlist_params)
      
       if @playlist.save
         redirect_to @playlist, notice: 'Playlist was successfully created.'
       else
         render :new
       end
    end

    def show
      @playlist = Playlist.find(params[:id])
    end
    
      
    private
      
    def playlist_params
      params.require(:playlist).permit(:name, music_ids: [])
    end
      
end      