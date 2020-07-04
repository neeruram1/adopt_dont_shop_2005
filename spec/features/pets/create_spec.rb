RSpec.describe "Creating a new shelter pet" do
  it "Should create a new pet for a shelter " do
    cozy_kitten = Shelter.create(name: "Cozy Kitten Animal Shelter", address: "123 Maple Street", city: "Brooklyn", state: "NY", zip:12345)

    visit "/shelters/#{cozy_kitten.id}/pets"

    name = "Alison"
    image = ""
    description = "The cutest kitten!"
    approx_age = 2
    sex = "Female"

    click_link "Create Pet"

    expect(current_path).to eq("/shelters/#{cozy_kitten.id}/pets/new")

    fill_in :image, with: image
    fill_in :name, with: name
    fill_in :description, with: description
    fill_in :approx_age, with: approx_age
    fill_in :sex, with: sex

    click_button "Create Pet"

    expect(current_path).to eq("/shelters/#{cozy_kitten.id}/pets")
    expect(page).to have_content(image)
    expect(page).to have_content(name)
    expect(page).to have_content(approx_age)
    expect(page).to have_content(sex)
    expect(page).to have_content(sex)
  end
end