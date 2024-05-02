class ModifyJoinTableMusicPlaylist < ActiveRecord::Migration[7.1]
  def change
    if index_exists?(:musics_playlists, [:music_id, :playlist_id], name: "index_musics_playlists_on_music_id_and_playlist_id")
      remove_index :musics_playlists, name: "index_musics_playlists_on_music_id_and_playlist_id"
    end
  end
end
