require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario "They click on a product and see product details page" do 
    visit root_path

    # click_link("a[href='/products/10']", match: :first)
    first("a[href='/products/10']").click
    # first('.title_link').click

    expect(page).to have_content('Name')


    puts page.html
    save_screenshot
  end

  scenario "Changed pages" do
  end

end
