class Album < ActiveRecord::Base
  has_attached_file :cover, :styles => { :large => "400x400#", :medium => "150x150#", :small => "50x50>" }
  belongs_to :user
  
  validates_presence_of :title, :artist
end
