class Post < ActiveRecord::Base
  validates :content, :presence => true, :length => {:maximum => 140}
  belongs_to :user
  attr_accessible :content
  has_many :comments
end
