RSpec.describe "Pets show page" do
  it "shows all image, name, description, approx age, sex, adoption status for a specific pet" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id )
    visit "/pets/#{cat1.id}"
    expect(page).to have_content("Name: Fred")
    expect(page).to have_content("Approximate Age: #{cat1.approx_age}")
    expect(page).to have_content("Sex: #{cat1.sex}")
    expect(page).to have_content(cat1.image)
    expect(page).to have_content("Description: #{cat1.description}")
    expect(page).to have_content("Adoption Status: #{cat1.adoption_status}")
  end

  it "Has a link to pets index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id )
    visit "/pets/#{cat1.id}"
    expect(page).to have_link("All Pets")
  end

  it "Has a link to shelter index page" do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id )
    visit "/pets/#{cat1.id}"
    expect(page).to have_link("All Shelters")
  end
end
