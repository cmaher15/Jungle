class User < ApplicationRecord

has_secure_password
validates :password, presence: true
validates :password, length: { minimum: 6 }
validates :password_confirmation, presence: true
validates :email, presence: true
validates :email, confirmation: {case_sensitive: false}
validates :name, presence: true
validates :email, uniqueness: true

def self.authenticate_with_credentials(email, password)
  user = User.find_by_email(email)

  if user && user.authenticate(password)
  return user
  else
  return nil
  end
end

end
