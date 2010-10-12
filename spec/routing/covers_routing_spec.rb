require "spec_helper"

describe CoversController do
  
  before :each do
    activate_authlogic
    @user = Factory(:user)
    UserSession.create @user
  end
  
  describe "routing" do

    it "recognizes and generates #new" do
      { :get => "/covers/new" }.should route_to(:controller => "covers", :action => "new")
    end

    it "recognizes and generates #create" do
      { :post => "/covers" }.should route_to(:controller => "covers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/covers/1" }.should route_to(:controller => "covers", :action => "update", :id => "1")
    end

  end
end
