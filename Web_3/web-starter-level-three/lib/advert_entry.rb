class AdvertEntry
  def initialize(id=nil, species, animal_name, colour)
    @id = id
    @species = species
    @animal_name = animal_name
    @colour = colour
  end
  
  def id()
    return @id
  end

  def species()
    return @species 
  end

  def animal_name
    return @animal_name
  end

  def colour
    return @colour
  end
end


