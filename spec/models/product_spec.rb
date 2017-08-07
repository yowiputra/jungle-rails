require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before :each do
      @product = Product.create
      @product.name = "Pickle"
      @product.price = 500
      @product.quantity = 1
      @category = Category.create
      @category.name = "Pickle"
      @product.category = @category
      @badproduct = Product.create
    end

    it "should have valid product" do
      expect(@product).to be_valid
    end

    it "should have valid name" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:name]).to include("can't be blank")
    end

    it "should have valid price" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:price]).to include("can't be blank")
    end

    it "should have valid quantity" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:quantity]).to include("can't be blank")
    end

    it "should have valid category" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:category]).to include("can't be blank")
    end

  end

end
