require "helpers/database_helpers"

RSpec.describe "advert feature", type: :feature do
    before(:each) do
        DatabaseHelpers.clear_table("adverts")
    end

    it "starts with an empty list" do
      visit "/advert"
      expect(page).to have_content "There are no listings currently!"
    end

    it "adds an advert to the list" do
      visit "/advert" # - Home page, should be blank initially.
      click_link "Add new advert" # - The computer clicks the "Add new advert" link on the page
      fill_in "species", with: "Cat" 
      fill_in "animal_name", with: "Monty"
      fill_in "colour", with: "Black"
      click_button "Add advert" # - The computer clicks, "Add advert" which takes me back to the /advert page
      expect(page).to have_content "Cat"
      expect(page).to have_content "Monty"
      expect(page).to have_content "Black"
    end

    it "delete advert" do
      visit "/advert" # - Home page, should be blank initially.
      click_link "Add new advert" # - The computer clicks the "Add new advert" link on the page
      fill_in "species", with: "Cat" 
      fill_in "animal_name", with: "Monty"
      fill_in "colour", with: "Black"
      click_button "Add advert" # - The computer clicks, "Add advert" which takes me back to the /advert page

      click_link "Add new advert" # - The computer clicks the "Add new advert" link on the page
      fill_in "species", with: "Dog" 
      fill_in "animal_name", with: "Ruby"
      fill_in "colour", with: "Red"
      click_button "Add advert" # - The computer clicks, "Add advert" which takes me back to the /advert page

      click_button "Delete Advert: Monty"

      expect(page).to have_content "Dog"
      expect(page).not_to have_content "Monty"
      expect(page).to have_content "Red"
    end

    it "edits the advert" do
      visit "/advert"
      click_link "Add new advert"
      fill_in "species", with: "Cat" 
      fill_in "animal_name", with: "Monty"
      fill_in "colour", with: "Black"
      click_button "Add advert" # - The computer clicks, "Add advert" which takes me back to the /advert page

      click_button "Edit advert: Monty"
      
      fill_in "species", with: "Dog" 
      fill_in "animal_name", with: "Gerrard"
      fill_in "colour", with: "Golden"
      click_button "Save edited advert" # - The computer clicks, "Add advert" which takes me back to the /advert page

      expect(page).to have_content "Dog"
      expect(page).not_to have_content "Monty"
      expect(page).to have_content "Gerrard"
      expect(page).to have_content "Golden"
    end

    it "updates the advert" do
      visit "/advert"
      click_link "Add new advert"
      fill_in "species", with: "Cat" 
      fill_in "animal_name", with: "Monty"
      fill_in "colour", with: "Black"
      click_button "Add advert" # - The computer clicks, "Add advert" which takes me back to the /advert page

      fill_in "species", with: "Dog" 
      fill_in "animal_name", with: "Gerrard"
      fill_in "colour", with: "Golden"
      click_button "Save edited advert"

      click_button "Edit advert: Monty"

      fill_in "species", with: "horse"
      fill_in "animal_name", with: "Blacky"
      fill_in "colour", with: "Grey"
      click_button "Save edited advert"


      expect(page).to have_content "Cat"
      expect(page).to have_content "Monty"
      expect(page).to have_content "Gerrard"
      expect(page).to have_content "Blacky"

    end
  end
end
