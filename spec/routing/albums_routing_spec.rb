require "spec_helper"

describe AlbumsController do
  
  before :each do
    activate_authlogic
    @user = Factory(:user)
    UserSession.create @user
  end
  
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/albums" }.should route_to(:controller => "albums", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/albums/new" }.should route_to(:controller => "albums", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/albums/1" }.should route_to(:controller => "albums", :action => "show", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/albums" }.should route_to(:controller => "albums", :action => "create")
    end


  end
end
