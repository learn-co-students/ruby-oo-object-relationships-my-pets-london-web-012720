class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = 'human'

    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def Owner.all
    @@all
  end

  def Owner.count
    @@all.length
  end

  def Owner.reset_all
    @@all = []
  end

  def cats 
    Cat.all.select{|c| c.owner == self}
  end

  def dogs
    Dog.all.select{|d| d.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.map{|d| d.mood = 'happy'}
  end

  def feed_cats
    cats.map{|c| c.mood = 'happy'}
  end

  def sell_pets
    dogs.map{|d| d.mood = 'nervous'}
    cats.map{|c| c.mood = 'nervous'}
    dogs.map{|d| d.owner = nil}
    cats.map{|c| c.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end