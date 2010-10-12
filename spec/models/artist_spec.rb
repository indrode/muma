require File.dirname(__FILE__) + '/../spec_helper'

# test the following model-specific specs
# 1) adding a valid artist
# 2) adding an artists with missing name
# 3) adding and artist that already exists

describe Artist do

  fixtures :artists

  before(:each) do
    @valid_attributes = {
      :name => "Lena",
      :genre => "rock",
      :country => "USA",
      :user_id => "1"
    }
    @invalid_attributes = {
      :name => "",
      :genre => "",
      :country => "",
      :user_id => "1"
    }
    @duplicate = {
      :name => "Aerosmith",
      :genre => "",
      :country => "",
      :user_id => "1"
    }
  end
  
  it "should create new artist given valid attributes" do
    newartist = Artist.create!(@valid_attributes)
    newartist.should be_valid
  end

  it "should not create artist with invalid attributes" do
    newartist = Artist.new(@invalid_attributes)
    newartist.should_not be_valid
  end
  
  it "should not create duplicate artist" do
    newartist = Artist.new(@duplicate)
    newartist.should_not be_valid
  end
end
