class UserLikeship < ActiveRecord::Base
  attr_accessible :like, :user
  belongs_to :like
  belongs_to :user
end
