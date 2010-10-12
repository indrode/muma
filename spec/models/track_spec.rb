require File.dirname(__FILE__) + '/../spec_helper'

# test the following model-specific specs
# 1) adding a valid track
# 2) adding a track with missing title
# 3) adding a track with missing tracknumber

describe Track do


  before(:each) do
    @valid_attributes = {
      :title => "tracktitle",
      :tracknumber => 1,
      :album_id => "10"
    }
    @missing_title = {
      :title => "",
      :tracknumber => 1,
      :album_id => "10"
    }
    @missing_number = {
      :title => "tracktitle",
      :tracknumber => "",
      :album_id => "10"
    }
    @invalid_number = {
      :title => "tracktitle",
      :tracknumber => "jkjk",
      :album_id => "10"
    }
  end
  
  it "should create new track given valid attributes" do
    track = Track.create!(@valid_attributes)
    track.should be_valid
  end

  it "should not create track with empty title" do
    track = Track.new(@missing_title)
    track.should_not be_valid
  end

  it "should not create track with missing tracknumber" do
    track = Track.new(@missing_number)
    track.should_not be_valid
  end
  
  it "should not create track with invalid tracknumber" do
    track = Track.new(@invalid_number)
    track.should_not be_valid
  end

end