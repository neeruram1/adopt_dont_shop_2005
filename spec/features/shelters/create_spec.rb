require 'rails_helper'

RSpec.describe "Create a new shelter" do
  describe 'when I visit the shelter index page' do
    it "I can follow a link to create a new shelter" do
      visit '/shelters'

      expect(page).to_not have_content("The Friendly Fish Animal Shelter")

      click_on 'New Shelter'

      expect(current_path).to eq('/shelters/new')

      fill_in :name, with: "The Friendly Fish Animal Shelter"
      fill_in :address, with: "456 Ocean Avenue"
      fill_in :city, with: "Boston"
      fill_in :state, with: "MA"
      fill_in :zip, with:98738

      click_on 'Create Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to have_content("The Friendly Fish Animal Shelter")
    end
  end
end
