class BlogUser < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
end
