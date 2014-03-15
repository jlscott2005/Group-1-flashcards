class User < ActiveRecord::Base
  has_secure_password
  validates  :user_name, presence: true, uniqueness: true
  validates  :email, presence: true, uniqueness: true
  # Remember to create a migration!

  def self.authenticate(user_name, password)
    user = self.find_by(user_name: user_name)
    if user && user.authenticate(password)
      user
    else
      false
    end
  end

end
