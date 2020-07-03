RSpec.describe "When I Visit a Shelter Show page" do
  it "I can click a button to destroy a shelter then I am redirected to the shelter's index page" do
    cozy_kitten1 = Shelter.create(name: "The Cozy Kitten Animal Shelter")

    visit "/shelters/#{cozy_kitten1.id}"

    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(cozy_kitten1.name)
  end
end
