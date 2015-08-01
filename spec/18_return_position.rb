require_relative 'spec_helper'

 #The Robot class can be asked to return all robots in a given position (x,y). It should return an array of all the robots since multiple robots could potentially be at position 0,0 (for example)

describe Robot do

  describe '.in_position' do 

    it "should return an array of all robots given a position x and y" do 
       @@robot_array = [] 
      robot1 = Robot.new
      robot2 = Robot.new

      expect(Robot.in_position(0,0)).to eq([robot1, robot2])
  
    end 
  end 

  describe '.in_position' do 

    it "should return an array of all robots given a position x and y" do 
       @@robot_array = [] 
      robot3 = Robot.new
    
      #robot 3 should be in position [-2,0]
      allow(robot3).to receive(:position).and_return([5,0])
      expect(Robot.in_position(5,0)).to eq([robot3])
    end 

  end 
  

  describe '.in_position' do 

    it "should return an array of all robots given a position x and y" do
      @@robot_array = [] 
      robot1 = Robot.new
      robot2 = Robot.new
      robot3 = Robot.new

       expect(Robot.in_position(1,1)).to eq([])
    end 
  end 


end 