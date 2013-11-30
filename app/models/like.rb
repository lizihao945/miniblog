class Like < ActiveRecord::Base
  belongs_to :post
  has_many :user_likeships
  has_many :user, through: :user_likeships
  attr_accessible :count
end
