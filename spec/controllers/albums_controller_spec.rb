require 'spec_helper'

describe AlbumsController do

  before(:each) do
    login_user
  end

  describe "#update" do
    before(:each) do
      @album = FactoryGirl.create(:album, :user => current_user)
    end
    it "should have 2 errors if title and artist are empty" do
      post :update, :id => @album.id, :user_id => @album.user_id, :album => {:title => '', :artist => ''}
      assigns[:album].should have(2).errors
    end
    it "should update the album setting new title" do
      new_title = 'new album title'
      post :update, :id => @album.id, :user_id => @album.user_id, :album => {:title => new_title}
      @album.reload.title.should == new_title 
    end
  end
  
  describe "#search" do
    before(:each) do
      %w{first first second third}.each do |artist|
        FactoryGirl.create(:album, :artist => artist, :user => current_user)
      end
    end
    it "should not find any albums" do
      post :search, :user_id => current_user, :query => 'zero'
      assigns[:albums].should_not be_any
    end  
    it "should find 2 albums" do
      post :search, :user_id => current_user, :query => 'first'
      assigns[:albums].count.should == 2
    end
  end
  
end
