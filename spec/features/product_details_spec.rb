require 'rails_helper'

RSpec.feature "Visitor views product details", type: :feature, js: true do

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

  scenario "They see product details" do
    visit root_path
    first('article.product').find_link('Details »').click
    sleep(4)
    save_screenshot "productdetails.png"
    expect(page).to have_css 'section.products-show'
  end

end
