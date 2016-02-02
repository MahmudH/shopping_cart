require 'rails_helper'

feature 'shopping cart' do
  context 'no stock item has been added' do
    scenario 'should display a prompt to add to stock' do
      visit '/stocks'
      expect(page).to have_content 'No clothing items availiable'
      expect(page).to have_link 'Add to stock'
    end
  end
end
