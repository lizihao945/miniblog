class User < ActiveRecord::Base
  has_many :likes
  attr_accessible :email, :name, :passwd, :image_url, :passwd_confirmation
  #email
  validates_uniqueness_of :email
  validates :email, format: { with: /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/, message: 'Invalid'}
  #name
  validates_presence_of :name, :email
  validates_uniqueness_of :name
  #passwd
  validates_presence_of :passwd_confirmation
  validates_confirmation_of :passwd, on: :create
  validates_presence_of :passwd, on: :create
  validates :passwd, length: {minimum: 6}

  def self.authenticate(email, passwd)
    user = find_by_email_and_passwd(email, passwd)
  end

end
