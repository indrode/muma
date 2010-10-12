require File.dirname(__FILE__) + '/../spec_helper'

# test the following model-specific specs
# 1) adding a valid comment
# 2) adding a comment with missing body

describe Comment do


  before(:each) do
    @valid_attributes = {
      :author => "anonymous",
      :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.",
      :album_id => "10",
      :posted => "2010-05-05"
    }
    @missing_body = {
      :author => "anonymous",
      :body => "",
      :album_id => "10",
      :posted => "2010-05-05"
    }
    @missing_posted = {
      :author => "anonymous",
      :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      :album_id => "10",
      :posted => ""
    }
  end
  
  it "should create new comment given valid attributes" do
    comment = Comment.create!(@valid_attributes)
    comment.should be_valid
  end

  it "should not create comment with empty body" do
    comment = Comment.new(@missing_body)
    comment.should_not be_valid
  end

  it "should not create comment with empty body" do
    comment = Comment.new(@missing_posted)
    comment.should_not be_valid
  end
end