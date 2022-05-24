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
    result = @db.run("INSERT INTO adverts (species) VALUES ($1) RETURNING id", [advert_listing.species])
    return result[0]["id"]
  end

  def remove()
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