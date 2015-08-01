require_relative 'spec_helper'

describe Robot do 

  before :each do 
    @robot = Robot.new
    @non_robot = Item.new("idiot",25)
  end 

  describe "#heal!" do
    it "raises RobotAlreadyDeadError when trying to revive a dead robot" do
      expect(@robot).to receive(:health).and_return(0)
      expect {@robot.heal!(50)}.to raise_error(Errors::RobotAlreadyDeadError)
    end 
  end 

  describe "#attack!" do 
    it "raises a UnattackableEnemy when trying to attack anything but another robot" do 
      expect {@robot.attack!(@non_robot)}.to raise_error(Errors::UnattackableEnemy)
    end 
  end 
  

end 