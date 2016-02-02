require 'rails_helper'

feature 'adding to cart' do
  before { Product.create name: 'Suede Shoes, Blue', qty: 5 }

  scenario 'allows user to add item to cart' do
    visit '/products'
    click_button 'Add to cart'
    select '3', from 'Qty'
    expect(current_path).to eq '/products'
    expect(page).to have_content '2 in stock'
  end

end
