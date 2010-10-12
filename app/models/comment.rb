class Comment < ActiveRecord::Base
  attr_accessible :author, :body, :posted, :album_id
  validates_presence_of :author, :body, :posted, :album_id
  belongs_to :album
end
