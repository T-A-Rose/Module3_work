RSpec.describe "Animals Feature (Example)", type: :feature do
  it "starts with an empty list of examples" do
    visit "/animals"
    expect(page).to have_content "There are currently no missing animals."
  end

  it "adds and lists animals" do
    visit "/animals"
    click_link "Post your advert here!"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    expect(page).to have_content "Frog"
  end

  it "adds and lists multiple animals" do
    visit "/animals"
    click_link "Post your advert here!"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    click_link "Post your advert here!"
    fill_in "Species", with: "Cat"
    click_button "Add Animal"
    click_link "Post your advert here!"
    fill_in "Species", with: "Dog"
    click_button "Add Animal"
    expect(page).to have_content "Frog"
    expect(page).to have_content "Cat"
    expect(page).to have_content "Dog"
  end

  it "deletes animals" do
    visit "/animals"
    click_link "Post your advert here!"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    click_link "Post your advert here!"
    fill_in "Species", with: "Cat"
    click_button "Add Animal"
    click_link "Post your advert here!"
    fill_in "Species", with: "Dog"
    click_button "Add Animal"

    save_and_open_page
    click_button "Delete Dog"

    expect(page).to have_content "Frog"
    expect(page).not_to have_content "Dog"
    expect(page).to have_content "Cat"
  end

  it "updates animals" do
    visit "/animals"
    click_link "Post your advert here!"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    click_link "Post your advert here!"
    fill_in "Species", with: "Cat"
    click_button "Add Animal"
    click_link "Post your advert here!"
    fill_in "Species", with: "Dog"
    click_button "Add Animal"

    click_link "Edit Dog"
    fill_in "Species", with: "Zebra"
    click_button "Update Animal"

    expect(page).to have_content "Frog"
    expect(page).not_to have_content "Dog"
    expect(page).to have_content "Zebra"
    expect(page).to have_content "Cat"
  end

  it "confirms the animal has been populated" do
    visit "/animals"
    click_link "Post your advert here!"
    fill_in "Species", with: "Cat"
    fill_in "Animal Name", with: "Monty"
    fill_in "Colour", with: "Black"
    fill_in "Size", with: "Fat"
    fill_in "Owners Name", with: "Tom"
    fill_in "Owners Number", with: "0199922"
    click_button "Add Animal"

    expect(page).to have_content "Cat"
    expect(page).to have_content "Monty"
    expect(page).to have_content "Black"
    expect(page).to have_content "Fat"
    expect(page).to have_content "Tom"
    expect(page).to have_content "0199922"
  end
end
