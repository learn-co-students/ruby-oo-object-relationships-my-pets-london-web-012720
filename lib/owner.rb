require 'pry'

class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self
  end

  def say_species 
    "I am a #{@species}."
  end

  def self.all 
    @@all
  end

  def self.count 
    self.all.count
  end

  def self.reset_all 
    self.all.clear
  end

  def cats
    Cat.all.select do |cat| 
      cat.owner == self 
    end
  end
  
  def dogs 
    Dog.all.select { |dog| dog.owner == self }
  end
  
  def buy_cat(name)
    new_cat = Cat.new(name, self) 
    new_cat.mood = "happy"
  end
  
  def buy_dog(name)
    new_dog = Dog.new(name, self)
    new_dog.mood = "happy"
  end
  
  def walk_dogs 
    Dog.all.each  do |dog| 
      dog.mood = "happy"
    end
  end 
  
  def feed_cats 
    Cat.all.each { |cat| cat.mood = "happy"}
  end 
  
  def sell_pets 
   Cat.all.each { |cat| cat.mood = "nervous"}
   Cat.all.each { |cat| cat.owner = nil}
   Dog.all.each { |dog| dog.mood = "nervous"}
   Dog.all.each { |dog| dog.owner = nil }
    
  end 

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end