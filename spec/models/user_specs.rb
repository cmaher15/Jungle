require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should be valid with valid attributes" do
      user1 = User.create(name: 'testPerson', email: 'test@123.com', password: 'testpassword', password_confirmation: 'testpassword')
      expect(user1).to be_valid
    end
    it "should be invalid without a password" do
      user2 = User.create(name: 'test2', email: 'test2@123.com', password_confirmation: '123456') 
      expect(user2).to be_invalid
      expect(user2.errors.full_messages[0]).to eql("Password can't be blank")
    end
  end
end