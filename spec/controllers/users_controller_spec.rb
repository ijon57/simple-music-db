require 'spec_helper'

describe UsersController do
  
  describe "#create" do
    it "should have 3 errors if email, password and password confirmation are empty" do
      post :create
      assigns[:user].should have(3).errors
    end
    it "should create new user if correct email, password and confirmation are provided" do
      post :create, :user => {:email=>'test@test.com', :password => 'pass', :password_confirmation => 'pass'}
      User.should be_any
    end
  end
end
