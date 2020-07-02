require 'rails_helper'

RSpec.describe "Shelters show page" do
  it "shows all name, address, city, state, zip for a specific shelter" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)

    visit "/shelters/#{cozy_kitten.id}"

    expect(page).to have_content(cozy_kitten.name)
    expect(page).to have_content("Address: #{cozy_kitten.address}")
    expect(page).to have_content("City: #{cozy_kitten.city}")
    expect(page).to have_content("State: #{cozy_kitten.state}")
    expect(page).to have_content("Zip: #{cozy_kitten.zip}")
  end
end
