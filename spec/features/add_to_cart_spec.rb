require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3), 
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 5, 
        price: 64.99
      )
    end
  end

  scenario "They click the Add To Cart button and the cart increases by 1" do

    visit root_path

    expect(page).to have_content('My Cart (0)')

    page.find('.button_to', match: :first).find_button('Add').click

    expect(page).to have_content('My Cart (1)')

    puts page.html
    save_screenshot

  end
end

