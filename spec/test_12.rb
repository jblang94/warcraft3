require_relative 'spec_helper'

describe Unit do 

  before :each do 
    @unit = Unit.new(30, 50)
  end

  describe "#dead?" do 
    it "should return true when a unit's health points are less than or equal to 0" do
      @unit.stub(:health_points) { -5 }
      expect(@unit.dead?).to be true
    end

    it "should return true when a unit's health points are equal to 0" do
      @unit.stub(:health_points) { 0 }
      expect(@unit.dead?).to be true
    end

    it "should return false when a unit's health points are greater than 0" do
      expect(@unit.dead?).to be false
    end
  end

  describe "#attack!" do
    it "should not attack an enemy unit that is already dead" do
      enemy_unit = Unit.new(0, 0)
      expect(enemy_unit).to receive(:damage).and_return(0)
      @unit.attack!(enemy_unit)
    end

    it "should not attack an enemy unit if the attacking unit is dead" do
      enemy_unit = Unit.new(50, 40)
      @unit.stub(:health_points) { 0 }
      expect(@unit.attack!(enemy_unit)).to be nil
    end
  end

end