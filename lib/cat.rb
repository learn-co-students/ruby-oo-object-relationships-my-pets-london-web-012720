class Cat
  
attr_accessor :owner, :mood
attr_reader :name

@@all = []

  def initialize(name, mood = "nervous", owner)
    @name = name 
    @mood = mood 
    @owner = owner 

    @@all << self
  end

  def self.all 
    @@all 
  end 

end 