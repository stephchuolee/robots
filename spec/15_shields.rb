require_relative 'spec_helper'


describe Robot do 

  # Robots can start with 50 shield points. 

  before :each do 
    @robot = Robot.new
  end 

  describe "#shield_points" do 
    it "should start at 50" do 
      expect(@robot.shield_points).to eq(50)
    end 
  end 


  # When the robot is damaged it first drains the shield and then starts affecting actual health.

  describe "#wound" do
    it "should take damage before the robot" do
      # expect(@robot).to receive(:wound).with(50)
      # attack to wound 
      @robot.wound(50)
      expect(@robot.shield_points).to eq(0)
      expect(@robot.health).to eq(100)
    end
  end 

  describe "#wound" do
    it  "should take damage after the shield has taken full damage" do
    @robot.wound(60)
    expect(@robot.shield_points).to eq(0)
    expect(@robot.health).to eq(90)
    end 
  end 


end 