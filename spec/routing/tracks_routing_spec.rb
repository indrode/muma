require "spec_helper"

describe TracksController do
  
  before :each do
    activate_authlogic
    @user = Factory(:user)
    UserSession.create @user
  end
  
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tracks" }.should route_to(:controller => "tracks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tracks/new" }.should route_to(:controller => "tracks", :action => "new")
    end

    it "recognizes and generates #create" do
      { :post => "/tracks" }.should route_to(:controller => "tracks", :action => "create")
    end

  end
end
