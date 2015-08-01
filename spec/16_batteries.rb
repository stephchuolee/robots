require_relative 'spec_helper'

#Batteries are items that can be used by robot to recharge its shield. Implement Battery item that can be used to recharge the Robot’s shield. Batteries have a weight of 25.

describe Batteries do 

  before :each do 
    @battery = Batteries.new
    @robot = Robot.new
  end 


  it "should be an Item" do
    expect(@battery).to be_a(Item)
  end

  it "should be named 'Battery'" do
    expect(@battery.name).to eq("Battery")
  end

  it "should weigh 25" do
    expect(@battery.weight).to eq(25)
  end

  describe "#recharge" do

    it "should recharge the shield to full health" do
      @battery.recharge(@robot)
      expect(@robot.shield_points).to eq(50)
    end 
  end 

end
