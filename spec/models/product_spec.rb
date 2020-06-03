require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do 
    before :each do
      @category = Category.create(name: 'Furniture')
      @product = Product.create( 
        name: "Jane",
        price: 34.00,
        quantity: 10,
        category_id: @category.id
      )
    end 


    it 'should save successfully ' do 
      @product = Product.new( 
        name: "Jane",
        price_cents: 34.00,
        quantity: 10,
        category_id: @category.id
      ).save
      expect(@product).to eq(true)
      
    end 

    it 'is not valid without a name' do 
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end 

    it 'is not valid without a price' do 
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end 

    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end 

    it 'is not valid without a category_id' do
      @product.category_id = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end 




  end 

end
