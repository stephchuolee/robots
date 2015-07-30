class Weapon < Item

  attr_accessor :name, :weight, :damage 

  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
  end 

  def hit(robot)
    robot.wound(damage)
  end 

end 

