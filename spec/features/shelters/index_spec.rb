RSpec.describe 'Shelter Index page' do
  it 'When I visit /shelters I see the names of all shelters' do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter")
    playful_pups = Shelter.create(name: "Playful Puppies Animal Shelter")

    visit '/shelters'

    expect(page).to have_content(cozy_kitten.name)
    expect(page).to have_content(playful_pups.name)
  end
end
