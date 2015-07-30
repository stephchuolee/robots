
class BoxOfBolts < Item

  attr_reader :name, :weight
  # HEAL_AMOUNT = 20
  def initialize
    super("Box of bolts", 25)
  end 

  def feed(robot)
    robot.heal(20)
    # alternatively, :: 
    # robot.health(HEAL_AMOUNT)
  end 


end 



### this could be done with heal as a variable, see weapon


# class BoxOfBolts < Item

#   attr_accessor :name, :weight, :heal

#   def initialize(name, weight, heal)
#     super("Box of bolts", 25)
#     @heal = 20 
#   end 

#   def feed(robot)
#     robot.heal(heal)
#   end 


# end 