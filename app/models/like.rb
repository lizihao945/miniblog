class Like < ActiveRecord::Base
  belongs_to :post
  attr_accessible :count
end
