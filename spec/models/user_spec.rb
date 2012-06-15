require 'spec_helper'

describe User do
  
  context "when creating" do
    it "should not be valid if email is invalid" do
      user = FactoryGirl.build(:user, :email => 'invalid_email')
      user.should_not be_valid
    end
    it "should not be valid if password is invalid" do
      user = FactoryGirl.build(:user, :password => '')
      user.should_not be_valid
    end
    it "should not be valid if password doesn't match its confirmation" do
      user = FactoryGirl.build(:user, :password => 'test', :password_confirmation => 'test2')
      user.should_not be_valid
    end
    it "should be valid with valid email and password" do
      FactoryGirl.build(:user).should be_valid
    end
  end
  
end
