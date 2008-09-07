class Blog < ActiveRecord::Base
  has_many :blog_users
  has_many :users, :through => :blog_users
  has_many :posts
  has_many :comments
end
