class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :content
  validates_presence_of :content
end
