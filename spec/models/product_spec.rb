require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should be valid with valid attributes" do
      cat1 = Category.create(name: 'testCat')
      prod1 = Product.new(name: 'testProd', price: 3000, quantity: 4, category: cat1)
      expect(prod1).to be_valid
    end
    it "should be invalid witout product name" do
      cat1 = Category.create(name: 'testCat')
      prod1 = Product.create(price: 3000, quantity: 4, category: cat1)
      expect(prod1).to be_invalid
      expect(prod1.errors.full_messages[0]).to eql("Name can't be blank")
    end
  end
end