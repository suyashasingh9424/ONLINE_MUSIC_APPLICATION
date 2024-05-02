class Music < ApplicationRecord
  belongs_to :artist
  has_one_attached :audio_file
  has_and_belongs_to_many :playlists
  
end
