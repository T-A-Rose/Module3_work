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
    result = @db.run("INSERT INTO adverts (species, animal_name, colour) VALUES ($1, $2, $3) RETURNING id", [advert_listing.species, advert_listing.animal_name, advert_listing.colour])
    return result[0]["id"]
  end

  def remove(index)
    result = @db.run("DELETE FROM adverts WHERE id = $1;", [index])
  end

  def update(index, species, animal_name, colour)
    result = @db.run("UPDATE adverts SET species = $1, animal_name = $3, colour = $4 WHERE id = $2;", [species, index, animal_name, colour])
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
      row["colour"]
    )
  end

end 