RSpec.describe "Pet index page" do
  it "can see a list of all pets and their attributes" do
    fish = Pet.create(image:"https://images.unsplash.com/photo-1524704654690-b56c05c78a00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80", name:"Fred", approx_age:2, sex:"Male", shelter_name:"The Friendly Fish Animal Shelter")
    cat = Pet.create(image:"https://images.squarespace-cdn.com/content/v1/55e7b445e4b04e7d0095c2cd/1556296318516-36C15R1S3A4H1GUP62QL/ke17ZwdGBToddI8pDm48kFyD7pzB8zoMIVY5aiUuFlp7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0jG2lbcDYBOeMi4OFSYem8DMb5PTLoEDdB05UqhYu-xbnSznFxIRsaAU-3g5IaylIg/AdobeStock_170586850+%281%29.jpeg?format=1000w", name:"Sophie", approx_age:3, sex:"Female", shelter_name:"The Cozy Kitten Animal Shelter")

    visit '/pets'

    expect(page).to have_content(fish.image)
    expect(page).to have_content("Name: #{fish.name}")
    expect(page).to have_content("Approximate Age: #{fish.approx_age}")
    expect(page).to have_content("Sex: #{fish.sex}")
    expect(page).to have_content("Shelter Name: #{fish.shelter_name}")

    expect(page).to have_content("Name: #{cat.name}")
    expect(page).to have_content("Approximate Age: #{cat.approx_age}")
    expect(page).to have_content("Sex: #{cat.sex}")
    expect(page).to have_content("Shelter Name: #{cat.shelter_name}")
  end
end
