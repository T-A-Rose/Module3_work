class Animal
  def initialize(species, animal_name, animal_colour, animal_size, owners_name, owners_number)
    @species = species
    @animal_name = animal_name
    @animal_colour = animal_colour
    @animal_size = animal_size
    @owners_name = owners_name
    @owners_number = owners_number
  end

  def species
    return @species
  end

  def animal_name
    return @animal_name
  end

  def animal_colour
    return @animal_colour
  end

  def animal_size
    return @animal_size
  end

  def owners_name
    return @owners_name
  end

  def owners_number
    return @owners_number
  end
 
end