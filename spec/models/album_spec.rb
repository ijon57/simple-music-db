require 'spec_helper'

describe Album do
  
  context "when creating" do
    it "should not be valid without title" do
      album = FactoryGirl.build(:album, :title => '')
      album.should_not be_valid
    end
    it "should not be valid without artist" do
      album = FactoryGirl.build(:album, :artist => '')
      album.should_not be_valid
    end
    it "should be valid with valid title and artist" do
      FactoryGirl.build(:album).should be_valid
    end
  end

  context "when an cover image was attached" do
    before(:each) do
      @album = FactoryGirl.build(:album)
      @album.update_attributes(:cover => File.new(Rails.root + 'data/cover.jpg'))
    end
    it "should have a large version of the cover" do
      @album.cover.url(:large).should be_present
    end
    it "should have a medium version of the cover" do
      @album.cover.url(:medium).should be_present
    end
    it "should have a small version of the cover" do
      @album.cover.url(:small).should be_present
    end
  end

end
