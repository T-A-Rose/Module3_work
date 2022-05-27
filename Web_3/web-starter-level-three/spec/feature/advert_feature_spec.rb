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
      fill_in "owner_name", with: "Tom"
      fill_in "owner_ci", with: "12345"
      fill_in "animal_found", with: "f"
      click_button "Add advert" # - The computer clicks, "Add advert" which takes me back to the /advert page
      expect(page).to have_content "Cat"
      expect(page).to have_content "Monty"
      expect(page).to have_content "Black"
      expect(page).to have_content "Tom"
      expect(page).to have_content "12345"
      expect(page).to have_content "f"
    end

    it "delete advert" do
      visit "/advert" # - Home page, should be blank initially.
      click_link "Add new advert" # - The computer clicks the "Add new advert" link on the page
      fill_in "species", with: "Cat" 
      fill_in "animal_name", with: "Monty"
      fill_in "colour", with: "Black"
      fill_in "owner_name", with: "Tom"
      fill_in "owner_ci", with: "12345"
      fill_in "animal_found", with: "f"
      click_button "Add advert" # - The computer clicks, "Add advert" which takes me back to the /advert page

      click_link "Add new advert" # - The computer clicks the "Add new advert" link on the page
      fill_in "species", with: "Dog" 
      fill_in "animal_name", with: "Ruby"
      fill_in "colour", with: "Red"
      fill_in "owner_name", with: "Jake"
      fill_in "owner_ci", with: "54321"
      fill_in "animal_found", with: "t"
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

      click_link "Edit advert: Monty"
      # save_and_open_page
      fill_in "species", with: "Dog" 
      fill_in "animal_name", with: "Gerrard"
      fill_in "colour", with: "Golden"
      fill_in "owner_name", with: "Tom"
      fill_in "owner_ci", with: "123456"
      fill_in "animal_found", with: "t"
      click_button "Save edited advert" # - The computer clicks, "Add advert" which takes me back to the /advert page

      expect(page).to have_content "Dog"
      expect(page).not_to have_content "Monty"
      expect(page).to have_content "Gerrard"
      expect(page).to have_content "Golden"
    end
end
