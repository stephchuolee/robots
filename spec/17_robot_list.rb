require_relative 'spec_helper'


describe Robot do


  it "should have an empty array to begin with" do
    @@robot_array = [] 
    expect(Robot.robot_array).to eq([])
  end 

  it "should keep track of all robots that are instantiated" do
    @@robot_array = [] 
    robot1 = Robot.new
    robot2 = Robot.new
    robot3 = Robot.new
    
    expect(Robot.robot_array).to eq([robot1, robot2, robot3])

  end 
  
end
