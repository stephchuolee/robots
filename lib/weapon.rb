class Weapon < Item

  attr_reader :name, :weight, :damage, :range 

  def initialize(name, weight, damage)
    super(name, weight)
    @damage = damage
  end 

  def hit(robot)
    robot.wound(damage)
  end 

end 

