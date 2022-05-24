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
end