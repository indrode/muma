require File.dirname(__FILE__) + '/../spec_helper'

describe Album do
  
  fixtures :artists
  
  before(:each) do
    @valid_attributes = {
      :title => "Animals",
      :label => "some record label",
      :artist_id => "1",
      :user_id => "1"
    }
    @missing_title = {
      :title => "",
      :label => "some record label",
      :artist_id => "1",
      :user_id => "1"
    }
    @missing_userid = {
      :title => "",
      :label => "some record label",
      :artist_id => "1",
      :user_id => ""
    }
  end
  
  it "should create new album given valid attributes" do
    newalbum = Album.create!(@valid_attributes)
    newalbum.should be_valid
  end

  it "should not create with invalid attributes" do
    newalbum = Album.new(@missing_title)
    newalbum.should_not be_valid
  end
  
  it "should not create with invalid attributes" do
    newalbum = Album.new(@missing_userid)
    newalbum.should_not be_valid
  end 
end
