require "spec_helper"

describe UserSessionsController do
  
  before :each do
    activate_authlogic
    @user = Factory(:user)
    UserSession.create @user
  end
  
  describe "routing" do

    it "recognizes logout route" do
      { :get => "/logout" }.should route_to(:controller => "user_sessions", :action => "destroy")
    end

    it "recognizes login route" do
      { :get => "/login" }.should route_to(:controller => "user_sessions", :action => "new")
    end
    
  end
end