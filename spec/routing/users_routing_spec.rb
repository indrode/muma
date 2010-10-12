require "spec_helper"

describe UsersController do
  
  before :each do
    activate_authlogic
    @user = Factory(:user)
    UserSession.create @user
  end
  
  describe "routing" do

    it "recognizes signup route" do
      { :get => "/users/new" }.should route_to(:controller => "users", :action => "new")
    end

    it "recognizes and generates user list" do
      { :get => "/list" }.should route_to(:controller => "users", :action => "list")
    end

    it "recognizes and generates search_albums" do
      { :post => "/search_albums" }.should route_to(:controller => "users", :action => "search_album")
    end

    it "recognizes and generates search_tracks" do
      { :post => "/search_tracks" }.should route_to(:controller => "users", :action => "search_track")
    end
    
  end
end