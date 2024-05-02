class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.string :name
      t.references :music, null: false, foreign_key: true

      t.timestamps
    end
  end
end
