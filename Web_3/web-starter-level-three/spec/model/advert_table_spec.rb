require "helpers/database_helpers"
require "advert_table"
require "advert_entry"

RSpec.describe AdvertTable do
  def clean_and_get_database
    DatabaseHelpers.clear_table("adverts")
    return DatabaseHelpers.test_db_connection
  end

  it "Confirm an empty table" do
    db = clean_and_get_database
    advert = AdvertTable.new(db)
    expect(advert.list).to eq([])
  end

  it "removes adverts" do
    db = clean_and_get_database
    advert_table = AdvertTable.new(db)

    # Note — just assuming the indexes are 1, 2, 3 doesn't work anymore
    # We need to let the database tell us what it has set the ID to.
    cat_id = advert_table.add(AdvertEntry.new("Cat", "Monty", "Black"))
    dog_id = advert_table.add(AdvertEntry.new("Dog", "Steve", "White"))
    frog_id = advert_table.add(AdvertEntry.new("Frog", "Fredrick", "Green"))

    advert_table.remove(dog_id)

    adverts = advert_table.list
    expect(adverts.length).to eq 2
    expect(adverts[0].species).to eq "Cat"
    expect(adverts[1].species).to eq "Frog"
  end
end