class Album < ActiveRecord::Base
  attr_accessible :title, :label, :release, :artist_id
  validates_presence_of :title
  belongs_to :artist
  belongs_to :user
  has_many :tracks
  has_many :comments
  has_many :covers
  
  # sphinx search settings
  define_index do
    # fields
    indexes title
    #indexes title, :sortable => true
    indexes artist.name
    #indexes author.name, :as => :author, :sortable => true
    
    # attributes
    has artist_id
    #has artist_id, created_at, updated_at
  end
end
