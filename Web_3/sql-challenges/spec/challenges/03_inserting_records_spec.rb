require "database_connection"

RSpec.describe "Inserting Records" do
  def setup_db
    db = DatabaseConnection.new("localhost", "sql_challenges")
    db.run("DROP TABLE IF EXISTS rocks;")
    db.run("CREATE TABLE rocks (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY, -- Don't worry about this, it's just to stop you from making mistakes
      name TEXT,
      weight INTEGER,
      qualities TEXT
    );")
    return db
  end

  xit "inserts a record" do
    db = setup_db

    # Fill out this line to insert a new rock to pass the test
    db.run("SELECT 1;")

    # Don't edit this
    result = db.run("SELECT * FROM rocks;")
    expect(result.to_a).to eq([
      { "id" => "1", "name" => "Granite", "weight" => "5", "qualities" => "crumbly" }
    ])
  end

  xit "inserts a record using placeholders" do
    db = setup_db

    # Fill out this line to insert a new rock to pass the test
    # Ensure you are using placeholders to insert data
    sql = "SELECT 1;"
    fields = []

    # Don't edit this
    db.run(verify_placeholders(sql), fields)
    result = db.run("SELECT * FROM rocks;")
    expect(result.to_a).to eq([
      { "id" => "1", "name" => "Granite", "weight" => "5", "qualities" => "crumbly" }
    ])
  end

  xit "inserts multiple records" do
    db = setup_db

    # Fill out these lines to insert new rocks to pass the test
    db.run(verify_placeholders("SELECT 1;"), [])
    db.run(verify_placeholders("SELECT 1;"), [])
    db.run(verify_placeholders("SELECT 1;"), [])
    db.run(verify_placeholders("SELECT 1;"), [])
    db.run(verify_placeholders("SELECT 1;"), [])

    # Don't edit this
    result = db.run("SELECT * FROM rocks;")
    expect(result.to_a).to eq([
      { "id" => "1", "name" => "Granite", "weight" => "5", "qualities" => "crumbly" },
      { "id" => "2", "name" => "Quartz", "weight" => "2", "qualities" => "cracky" },
      { "id" => "3", "name" => "Basalt", "weight" => "10", "qualities" => "hard" },
      { "id" => "4", "name" => "Andesite", "weight" => "15", "qualities" => "rough" },
      { "id" => "5", "name" => "Dacite", "weight" => "20", "qualities" => "'cutie-pie'" }
    ])
  end

  # You will sometimes need to get the ID of the record you just inserted, so
  # you can direct the user to the newly created record. This challenge is
  # about that.
  xit "gets the ID of the inserted record" do
    db = setup_db
    insert_random_number_of_records(db) # Don't edit this

    # Fill out these lines to insert a new rock to pass the test
    # You also need to get the ID of record you just inserted
    # For this, look up `RETURNING id`.
    result = db.run(verify_placeholders("SELECT 1;"), [])
    id = 0 # This will need to change too.

    # Don't edit this
    result = db.run("SELECT * FROM rocks WHERE id = $1;", [id])
    expect(result.to_a).to eq([
      { "id" => id, "name" => "Granite", "weight" => "5", "qualities" => "crumbly" }
    ]);
  end

  def verify_placeholders(sql)
     # Don't edit this
    fail "You didn't use placeholders." unless sql.include? "$1"
    fail "You didn't use placeholders." unless sql.include? "$2"
    fail "You didn't use placeholders." unless sql.include? "$3"
    return sql
  end

  def insert_random_number_of_records(db)
     # Don't edit this
    rand(25).times do
      db.run("INSERT INTO rocks (name, weight, qualities) VALUES ($1, $2, $3);", ["Fake", "5", "fake"])
    end
  end
end