require 'rails_helper'

feature 'shopping cart' do
  context 'no clothing item has been added' do
    scenario 'should display a prompt to add an item' do
      visit '/clothing'
      expect(page).to have_content 'No clothing items availiable'
      expect(page).to have_link 'Add an item'
    end
  end
end
