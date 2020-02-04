require 'pry'
class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species 

    @@all << self
  end

  def self.all 
    @@all
  end 

  def say_species
     "I am a #{self.species}."
  end

  def self.count 
      self.all.count
  end 

  def self.reset_all 
      self.all.clear
  end 
  
  def cats 
      Cat.all.select { |cat| cat.owner == self}
  end 

  def dogs
      Dog.all.select { |dog| dog.owner == self}
  end 

  def buy_cat(name)
      Cat.new(name, self)
  end 
  
  def buy_dog(name)
      Dog.new(name, self)
  end 

  def walk_dogs
      dogs.map {|dog| dog.mood = "happy"}
  end 

  def feed_cats 
      cats.map { |cats| cats.mood = "happy"}
  end 

  def sell_pets 
      cats.map do |cats| 
        cats.mood = "nervous"
        cats.owner = nil 
      end
      dogs.map do |dog| 
        dog.mood = "nervous"
         dog.owner = nil
      end 
  end 

  def list_pets 
      "I have #{dogs.count} dog(s), and #{dogs.count} cat(s)."
  end 
end

