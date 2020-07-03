RSpec.describe 'as a visitor' do
  describe 'when I visit /pets' do
    it 'then I see a lit of all pets including all their attributes' do

      shelter = Shelter.create(name: "The Cozy Kitten Animal Shelter")
      cat1 = Pet.create!(name: 'Fred', approx_age: 2, sex: "Male", image: "", shelter_id: shelter.id )
      cat2 = Pet.create!(name: 'Sophie', approx_age: 6, sex: "Female", image: "", shelter_id: shelter.id )

      visit '/pets'

      expect(page).to have_content("Name: Fred")
      expect(page).to have_content("Approximate Age: #{cat1.approx_age}")
      expect(page).to have_content("Sex: #{cat1.sex}")
      expect(page).to have_content(cat1.image)
      expect(page).to have_content("The Cozy Kitten Animal Shelter")
      expect(page).to have_content("Name: Sophie")
      expect(page).to have_content("Approximate Age: #{cat2.approx_age}")
      expect(page).to have_content("Sex: #{cat2.sex}")
      expect(page).to have_content(cat2.image)
    end
  end
end
