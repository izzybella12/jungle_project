require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before do 
      @category = Category.new
      @product = @category.products.new
      @product.name = "Piano"
      @product.price = 1200
      @product.quantity = 1
    end

    it 'contains name, price, quantity, and category' do
      @product.save
      expect(@product.id).to_not be nil
    end

    it 'is invalid if name is not present' do
      @product.name = nil 
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is invalid if price is not present' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is invalid if quantity is not present' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid if it is not in a category' do
      @product.category = nil
      @product.save 
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
