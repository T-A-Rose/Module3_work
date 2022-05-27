$:.unshift File.join(File.dirname(__FILE__), 'lib')
require "database_connection"

# This file sets up the database tables. If you change any of the contents
# of this file, you should rerun `ruby reset_tables.rb` to ensure that your
# database tables are re-created.

def reset_tables(db)
  db.run("DROP TABLE IF EXISTS adverts;")
  db.run("CREATE TABLE adverts (
    id SERIAL PRIMARY KEY, 
    species TEXT NOT NULL, 
    animal_name TEXT NOT NULL, 
    colour TEXT NOT NULL, 
    owner_name TEXT NOT NULL, 
    owner_ci TEXT NOT NULL, 
    animal_found boolean DEFAULT false, 
    adv_pass TEXT NOT NULL);")
end

dev_db = DatabaseConnection.new("localhost", "web_application_dev")
reset_tables(dev_db)

test_db = DatabaseConnection.new("localhost", "web_application_test")
reset_tables(test_db)
