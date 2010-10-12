require "spec_helper"

describe ArtistsController do
  
  before :each do
    activate_authlogic
    @user = Factory(:user)
    UserSession.create @user
  end
  
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/artists" }.should route_to(:controller => "artists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/artists/new" }.should route_to(:controller => "artists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/artists/1" }.should route_to(:controller => "artists", :action => "show", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/artists" }.should route_to(:controller => "artists", :action => "create")
    end

  end
end
