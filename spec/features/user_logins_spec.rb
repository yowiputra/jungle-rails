require 'rails_helper'

RSpec.feature "Visitor should be able to log-in", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )

    @user = User.create(
     name: 'Yohan Wiputra',
     email: 'yowiputra@gmail.com',
     password: '1234',
     password_confirmation: '1234'
    )
  end

  scenario "They should be able to log-in" do
    visit '/sessions/new'

    within 'form' do
      fill_in id: 'email', with: @user.email
      fill_in id: 'password', with: @user.password
      click_button 'Submit'
    end

    sleep(4)

    expect(page).to have_css 'section.products-index'
  end

end
