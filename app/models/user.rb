class User < ActiveRecord::Base
  
  has_many :albums
  acts_as_authentic
end
