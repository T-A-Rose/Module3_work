class AdvertEntry
  def initialize(id=nil, species, animal_name, colour, owner_name, owner_ci, animal_found, adv_pass)
    @id = id
    @species = species
    @animal_name = animal_name
    @colour = colour
    @owner_name = owner_name
    @owner_ci = owner_ci
    @animal_found = @animal_found
    @adv_pass = adv_pass
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

  def owner_name
    return @owner_name
  end

  def owner_ci
    return @owner_ci
  end

  def animal_found
    return @animal_found
  end

  def adv_pass
    return @adv_pass
  end

end


