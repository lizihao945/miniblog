class User < ActiveRecord::Base
  attr_accessible :email, :name, :passwd
end
