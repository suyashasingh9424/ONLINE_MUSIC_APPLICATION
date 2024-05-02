class CreateMusics < ActiveRecord::Migration[7.1]
  def change
    create_table :musics do |t|
      t.string :title
      t.integer :duration
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
