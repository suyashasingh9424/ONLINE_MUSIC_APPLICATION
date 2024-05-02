class CreateJoinTableMusicPlaylist < ActiveRecord::Migration[7.1]
  def change
    create_join_table :musics, :playlists do |t|
      t.index [:music_id, :playlist_id]
      t.index [:playlist_id, :music_id]
    end
  end
end
