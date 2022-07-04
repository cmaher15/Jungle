class User < ApplicationRecord

has_secure_password
validates :password, presence: true
validates :password_confirmation, presence: true
validates :email, presence: true
validates :name, presence: true
validates :email, uniqueness: true
end
