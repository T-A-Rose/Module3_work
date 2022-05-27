class AdvertTable
  def initialize(db)
    @db = db
  end

  def list
    return @db.run("SELECT * FROM adverts ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

  def add(advert_listing)
    result = @db.run("INSERT INTO adverts (species, animal_name, colour, owner_name, owner_ci, animal_found, adv_pass) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id", [advert_listing.species, advert_listing.animal_name, advert_listing.colour, advert_listing.owner_name, advert_listing.owner_ci, advert_listing.animal_found, advert_listing.adv_pass])
    return result[0]["id"]
  end

  def remove(index)
    result = @db.run("DELETE FROM adverts WHERE id = $1;", [index])
  end

  def update(index, species, animal_name, colour, owner_name, owner_ci, animal_found)
    result = @db.run("UPDATE adverts SET species = $1, animal_name = $3, colour = $4, owner_name = $5, owner_ci = $6, animal_found = $7 WHERE id = $2;", [species, index, animal_name, colour, owner_name, owner_ci, animal_found])
  end

  def get(index)
    result = @db.run("SELECT * FROM adverts WHERE id = $1;", [index])
    return row_to_object(result[0])
  end

  def row_to_object(row)
    return AdvertEntry.new(
      row["id"],
      row["species"],
      row["animal_name"],
      row["colour"],
      row["owner_name"],
      row["owner_ci"],
      row["animal_found"],
      row["adv_pass"]
    )
  end

end 