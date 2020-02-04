class Owner

  attr_reader :name, :species

  @@all = []
 
    def initialize(name,species="human")
      @name = name
      @species = species
      @@all << self
    end

    def say_species
    "I am a #{@species}."
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
    Cat.all.select { |x| x.owner == self}
    end

    def dogs
      Dog.all.select { |x| x.owner == self}
    end
  
    def buy_cat(cat_name)
      #pp c "crookshanks"
      Cat.new(cat_name, self, "derp" )
    end
    
    def buy_dog(dog_n)
      #pp c "crookshanks"
      Dog.new(dog_n, self, "derp" )
    end
    
    def walk_dogs
      dogs.map { |d| d.mood = "happy"}
    end

    def feed_cats
      cats.map { |d| d.mood = "happy"}
    end


    def sell_pets
      cats.map { |d| 
      d.mood = "nervous"   
      d.owner = nil 
      }

      dogs.map { |d| 
      d.mood = "nervous"
      d.owner = nil
      }
    end

    def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
    end



end