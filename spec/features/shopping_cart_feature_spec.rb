require 'rails_helper'

feature 'shopping cart' do
  context 'no stock item has been added' do
    scenario 'should display a prompt to add to stock' do
      visit '/stocks'
      expect(page).to have_content 'No clothing items availiable'
      expect(page).to have_link 'Add to stock'
    end
  end

  context 'Stocks have been added' do
    before do
      Stock.create(name: 'Almond Toe Court Shoes, Patent Black', category: 'Women’s Footwear', price: 99.00, qty: 5)
    end

    scenario 'display items in stock' do
      visit '/stocks'
      expect(page).to have_content 'Almond Toe Court Shoes, Patent Black'
      expect(page).not_to have_content 'No clothing items availiable'
    end

  end
end
