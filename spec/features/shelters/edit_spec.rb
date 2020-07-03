RSpec.describe "Shelter edit" do
  it "When I visit a shelter show page I can edit info" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")

    visit "/shelters/#{cozy_kitten.id}"

    expect(page).to_not have_content("The Cutest Kitten Animal Shelter")

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{cozy_kitten.id}/edit")

    fill_in :name, with: "The Cutest Kitten Animal Shelter"
    fill_in :address, with: "46 Penny Lane"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with:98738

    click_on "Update Shelter Information"
    expect(current_path).to eq("/shelters/#{cozy_kitten.id}")
    expect(page).to have_content("The Cutest Kitten Animal Shelter")
  end
end
