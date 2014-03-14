class User < ActiveRecord::Base
  has_secure_password
  validates  :user_name, presence: true, uniqueness: true
  validates  :email, presence: true, uniqueness: true
  # Remember to create a migration!
end
