RSpec.describe "Shelter Pets index page" do
  it "When I visit '/shelters/:shelter_id/pets' I see all pets that can be adopted from that shelter" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    puppy_playground = Shelter.create(name: "The Puppy Playground", address: "125 Maple Street", city: "Brooklyn", state: "NY", zip:12345)

    cat1 = Pet.create!(name: 'Fred', approx_age: 2, sex: "Male", image: "", shelter_id: cozy_kitten.id )
    cat2 = Pet.create!(name: 'Sophie', approx_age: 6, sex: "Female", image: "", shelter_id: cozy_kitten.id )
    dog1 = Pet.create!(name: 'Milo', approx_age: 3, sex: "Male", image: "", shelter_id: puppy_playground.id)

    visit "/shelters/#{cozy_kitten.id}/pets"

    expect(page).to have_content("Name: Fred")
    expect(page).to have_content("Approximate Age: #{cat1.approx_age}")
    expect(page).to have_content("Sex: #{cat1.sex}")
    expect(page).to have_content(cat1.image)
    expect(page).to have_content("Name: Sophie")
    expect(page).to have_content("Approximate Age: #{cat2.approx_age}")
    expect(page).to have_content("Sex: #{cat2.sex}")
    expect(page).to have_content(cat2.image)
    expect(page).to_not have_content("Name: Milo")
    expect(page).to_not have_content("Approximate Age: #{dog1.approx_age}")
  end
end
