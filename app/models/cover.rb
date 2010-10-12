class Cover < ActiveRecord::Base
  attr_accessible :artwork, :album_id
  belongs_to :album
  has_attached_file :artwork
  
  # paperclip upload settings
  validates_attachment_presence :artwork
  validates_attachment_size :artwork, :less_than => 5.megabytes
  validates_attachment_content_type :artwork, :content_type => ['image/jpeg', 'image/png']
end