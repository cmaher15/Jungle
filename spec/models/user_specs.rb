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
    it "should be invalid without a password confirmation" do
      user3 = User.create(name: 'test3', email: 'test2@123.com', password: '123456') 
      expect(user3).to be_invalid
      expect(user3.errors.full_messages[0]).to eql("Password confirmation can't be blank")
    end
    it "should be invalid if password and password confirmation don't match" do
      user4 = User.create(name: 'test4', email: 'test2@123.com', password: 'appplesauce', password_confirmation: '123456') 
      expect(user4).to be_invalid
      expect(user4.errors.full_messages[0]).to eql("Password confirmation doesn't match Password")
    end
  end
end