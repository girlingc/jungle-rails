require 'rails_helper'

RSpec.feature "Visitor adds a product to cart", type: :feature, js: true do
   # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product to cart" do
    visit root_path
    click_button( "Add", match: :first)
    expect(page).to have_content("My Cart (1)")
    save_screenshot
  end
end