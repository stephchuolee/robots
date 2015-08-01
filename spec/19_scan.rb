require_relative 'spec_helper'

#A given robot should be able to scan its surroundings (tiles immediately next to its current @position) Note: You should leverage the class method implemented in #18

describe Robot do

  describe "#scan" do 

    it "should return an array of robots if there are robots next to it" do 
      @robot = Robot.new
      robot1 = Robot.new
      robot2 = Robot.new
      robot3 = Robot.new
      robot4 = Robot.new 

      robot1.move_up
      robot2.move_down
      robot3.move_right

      expect(@robot.scan).to eq([robot3, robot2, robot1])
    end 
  end 
end 