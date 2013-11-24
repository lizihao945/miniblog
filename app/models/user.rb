class User < ActiveRecord::Base
  attr_accessible :email, :name, :passwd, :passwd_confirmation
  #email
  validates_uniqueness_of :email
  #name
  validates_presence_of :name
  validates_uniqueness_of :name
  #passwd
  validates_confirmation_of :passwd
  validates_presence_of :passwd, :on => :create

  def self.authenticate(email, passwd)
    user = find_by_email_and_passwd(email, passwd)
  end

end
