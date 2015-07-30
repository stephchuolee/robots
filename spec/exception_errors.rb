require_relative 'spec_helper'

describe Robot do 

  before :each do 
    @robot = Robot.new
    @robot.health = 0
    @non_robot = Item.new("idiot",25)
  end 

  describe "#heal!" do
    it "raises RobotAlreadyDeadError when trying to revive a dead robot" do
      expect {@robot.heal!}.to raise_error(Errors::RobotAlreadyDeadError)
    end 
  end 

  describe "#attack!" do 
    it "raises a UnattackableEnemy when trying to attack anything but another robot" do 
      expect {@robot.attack!(@non_robot)}.to raise_error(Errors::UnattackableEnemy)
    end 
  end 
  

end 