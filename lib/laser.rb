class Laser < Weapon 

  attr_accessor :name, :weight, :damage

  def initialize
    super("Laser", 125, 25)
  end 

end 


