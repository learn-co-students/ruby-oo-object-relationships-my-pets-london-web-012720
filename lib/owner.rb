class Owner
  attr_reader :name, :species
  @@all = []
def initialize(name)
  @name = name
  @@all << self
end

def species
  @species = "human"
end

def say_species
  "I am a #{self.species}."
end
def self.all
@@all
end

def self.count
  @@all.size
end

def self.reset_all
  @@all.clear
end

def cats 
  Cat.all.select {|c|c.owner == self}
end


def dogs
  Dog.all.select {|c|c.owner == self}
end

def buy_cat(cat)
  Cat.new(cat, self)
   end

   def buy_dog(dog)
    Dog.new(dog, self)
   end
   
   def walk_dogs
    dogs.each {|d|d.mood = "happy"}
   end

   def feed_cats
    cats.each {|c|c.mood = "happy"}
   end

   def change_mood(element)
    element.each {|c|c.mood = "nervous"}
   end
   
   def sell_pets
    change_mood(cats).each {|p| p.owner = nil}
    change_mood(dogs).each {|p| p.owner = nil}
   end

   def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
   end
end