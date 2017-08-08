require 'rails_helper'

RSpec.feature "Visitor adds to cart", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They add item to cart" do
    visit root_path
    first('article.product').find_link('Add').click
    sleep(4)
    save_screenshot 'addtocart.png'
    expect(page).to have_link 'My Cart (1)', href: '/cart'
  end
end
