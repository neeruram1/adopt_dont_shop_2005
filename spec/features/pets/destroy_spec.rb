RSpec.describe "When I Visit a Pet Show page" do
  it "I can click a button to destroy a pet then I am redirected to the pet's index page where I do not see this pet" do
    cozy_kitten = Shelter.create(name: "The Cozy Kitten Animal Shelter")
    cat1 = Pet.create(name: 'Fred', approx_age: 2, sex: "Male", image: "", description: "Fred is the sweetest boy", adoption_status: "Adoptable", shelter_id: cozy_kitten.id)
    visit "/pets/#{cat1.id}"
    click_on "DELETE #{cat1.name.upcase}"
    expect(current_path).to eq("/pets")
    expect(page).to_not have_content(cat1.name)
  end
end
