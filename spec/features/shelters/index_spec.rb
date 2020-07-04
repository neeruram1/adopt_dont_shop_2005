RSpec.describe 'Shelter Index page' do
  it 'When I visit /shelters I see the names of all shelters' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    playful_pups = Shelter.create(name: "Playful Puppies Animal Shelter")

    visit '/shelters'

    expect(page).to have_content(cozy_kitten.name)
    expect(page).to have_content(playful_pups.name)
  end

  describe "When I visit /shelters I see a link to edit shelter info next to every shelter"
    it "When I click the link I'm taken to a page to edit shelter's info" do
      cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
      visit '/shelters'
      click_link "Edit #{cozy_kitten.name}'s Info"
      expect(current_path).to eq("/shelters/#{cozy_kitten.id}/edit")
  end

  describe "When I visit /shelters I see a link to delete shelter next to every shelter"
    it "When I click the link the shelter is deleted and I no longer see the page on the shelter index page" do
      cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
      visit '/shelters'
      click_link "Delete #{cozy_kitten.name}"
    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Cozy Kitten Animal Shelter")
  end
end
