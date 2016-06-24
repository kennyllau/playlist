class User < ActiveRecord::Base
  has_secure_password
  has_many :songs, through: :songlist
  has_many :songlists


  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, :on => :create
  validates :email, uniqueness: { case_sensitive: false }, format: { with: email_regex }




end
