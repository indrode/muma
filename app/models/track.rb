class Track < ActiveRecord::Base
  attr_accessible :title, :duration, :tracknumber, :album_id
  validates_presence_of :title, :tracknumber, :album_id
  validates_numericality_of :tracknumber
  belongs_to :album
  
  # sphinx search settings
  define_index do
    # fields
    indexes title
    #indexes title, :sortable => true
    indexes album.artist.name
    #indexes author.name, :as => :author, :sortable => true
    
    # attributes
    has album_id
    #has artist_id, created_at, updated_at
  end
  
end
