require 'rails_helper'

feature 'product inventory' do
  context 'no product item has been added' do
    scenario 'should display a prompt to add to product' do
      visit '/products'
      expect(page).to have_content 'No clothing items availiable'
      expect(page).to have_link 'Add new item to product'
    end
  end

  context 'products have been added' do
    before do
      Product.create(name: 'Almond Toe Court Shoes, Patent Black', category: 'Women’s Footwear', price: 99.00, qty: 5)
    end

    scenario 'display items in product' do
      visit '/products'
      expect(page).to have_content 'Almond Toe Court Shoes, Patent Black'
      expect(page).not_to have_content 'No clothing items availiable'
    end
  end

  context 'adding items to product' do
    scenario 'prompts user to fill out a form, then displays the new item' do
      visit '/products'
      click_link 'Add new item to product'
      fill_in 'Name', with: 'Almond Toe Court Shoes, Patent Black'
      fill_in 'Category', with: 'Women\'s footwear'
      fill_in 'Price', with: 99.00
      fill_in 'Qty', with: 5
      click_button 'Create item'
      expect(page).to have_content 'Almond Toe Court Shoes'
      expect(current_path).to eq '/products'
    end
  end

  context 'viewing items' do
    let!(:shoes){ Product.create(name: 'Almond Toe Court Shoes', category: 'Women\s footwear') }

    scenario 'lets a user view the item' do
      visit '/products'
      click_link 'Almond Toe Court Shoes'
      expect(page).to have_content 'Almond Toe Court Shoes'
      expect(current_path).to eq "/products/#{shoes.id}"
    end
  end

  context 'editing an item' do
    before { Product.create name: 'Angular Toe Court Shoes' }

    scenario 'let a user edit an item in the product' do
      visit '/products'
      click_link 'Edit item'
      fill_in 'Name', with: 'Almond Toe Court Shoes'
      click_button 'Update item'
      expect(page).to have_content 'Almond Toe Court Shoes'
      expect(current_path).to eq '/products'
    end
  end

  context 'deleting an item from from product list' do
    before { Product.create name: 'Almond Toe Court Shoes' }

    scenario 'removes an item when a user clicks the delete click' do
      visit '/products'
      click_link 'Delete item'
      expect(page).not_to have_content 'Almond Toe Court Shoes'
      expect(page).to have_content 'Item deleted successfully'
    end
  end

end
