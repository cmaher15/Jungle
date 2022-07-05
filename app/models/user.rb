class User < ApplicationRecord

has_secure_password
validates :password, presence: true
validates :password, length: { minimum: 6 }
validates :password_confirmation, presence: true
validates :email, presence: true
validates :name, presence: true
validates :email, uniqueness: {case_sensitive: false}

def self.authenticate_with_credentials(email, password)
  newEmail = email.downcase.strip
  user = User.find_by_email(newEmail)
  if user && user.authenticate(password)
    return user
  else
    return nil
   end
 end
end
