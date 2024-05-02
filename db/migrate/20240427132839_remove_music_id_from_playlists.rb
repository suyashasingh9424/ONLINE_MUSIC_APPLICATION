class RemoveMusicIdFromPlaylists < ActiveRecord::Migration[7.1]
  def change
    remove_reference :playlists, :music, null: false, foreign_key: true
  end
end
