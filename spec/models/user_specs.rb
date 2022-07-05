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
    it "should be invalid if password does not meet minimum length" do
      user5 = User.create(name: 'test5', email: 'test2@123.com', password: '123', password_confirmation: '123') 
      expect(user5).to be_invalid
      expect(user5.errors.full_messages[0]).to eql("Password is too short (minimum is 6 characters)")
    end
    it "should be invalid without a users name" do
      user6 = User.create(email: 'test6@123.com', password: '123456', password_confirmation: '123456') 
      expect(user6).to be_invalid
      expect(user6.errors.full_messages[0]).to eql("Name can't be blank")
    end
    it "should be invalid without a users email" do
      user7 = User.create(name: 'test7', password: '123456', password_confirmation: '123456') 
      expect(user7).to be_invalid
      expect(user7.errors.full_messages[0]).to eql("Email can't be blank")
    end
    it "should not allow a user to register with an email already in database" do
      user8 = User.create(name: 'test8', email: 'test8@123.com', password: '123456', password_confirmation: '123456') 
      user9 = User.create(name: 'test9', email: 'TEST8@123.COM', password: '123456', password_confirmation: '123456')
      expect(user9.errors.full_messages[0]).to eql("Email has already been taken")
      expect(user9).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should allow a user to login with a valid email and password" do
      user10 = User.create(name: 'test10', email: 'test10@123.com', password: '123456', password_confirmation: '123456')
      userLogin = User.authenticate_with_credentials('test10@123.com', '123456')
      expect(userLogin).to eq(user10)
    end
    it "should allow a user to login with an email regardless of case" do
      user11 = User.create(name: 'test11', email: 'test11@123.com', password: '123456', password_confirmation: '123456')
      userLogin = User.authenticate_with_credentials('TEST11@123.COM', '123456')
      expect(userLogin).to eq(user11)
    end
    it "should allow a user to login with an email regardless of leading/trailing spaces" do
        user12 = User.create(name: 'test12', email: 'test12@123.com', password: '123456', password_confirmation: '123456')
        userLogin = User.authenticate_with_credentials('      test12@123.com ', '123456')
        expect(userLogin).to eq(user12)
    end
    it "should be invalid if user enters incorrect password" do
        user13 = User.create(name: 'test13', email: 'test13@123.com', password: '123456', password_confirmation: '123456')
        userLogin = User.authenticate_with_credentials('test13@123.com', 'applesauce')
        expect(userLogin).to_not eq(user13)
    end
  end
end