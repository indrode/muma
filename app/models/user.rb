class User < ActiveRecord::Base
  acts_as_authentic
  has_many :artists
  has_many :albums
  
  #acts_as_authentic do |c|
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  #end # block optional
end
