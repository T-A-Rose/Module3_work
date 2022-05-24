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
      visit "/advert"
      click_link "Add new advert"
      fill_in "species", with: "Cat"
      click_button "Add advert"
      expect(page).to have_content "Cat"
    end
end
