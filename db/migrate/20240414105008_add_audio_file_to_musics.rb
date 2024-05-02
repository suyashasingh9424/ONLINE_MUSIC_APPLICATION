class AddAudioFileToMusics < ActiveRecord::Migration[7.1]
  def change
    add_column :musics, :audio_file, :binary
  end
end
