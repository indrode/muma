class Artist < ActiveRecord::Base
  attr_accessible :name, :genre, :country, :user_id
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :albums
  belongs_to :user
end
