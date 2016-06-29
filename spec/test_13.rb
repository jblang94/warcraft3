require_relative 'spec_helper'

# Tests if a SiegeEngine can be created and initialized properly
# Specifies what a SiegeEngine can and cannot attack, and if it can attack, the amount of damage the enemy takes
describe SiegeEngine do 

  before :each do
    @siege_engine = SiegeEngine.new
  end

  describe ".new" do
    it "should have an initial HP of 400" do 
      expect(@siege_engine.health_points).to eql(400)
    end

    it "should have an initial AP of 50" do
      expect(@siege_engine.attack_power).to eql(50)
    end
  end

  describe "#attack!" do
    it "should do 50 damage when attacking another SiegeEngine" do
      enemy = SiegeEngine.new
      damage_taken = 50
      @siege_engine.attack!(enemy)
      expect(enemy.health_points).to eq(400 - damage_taken)
    end

    it "should do 100 damage when attacking Barracks" do
      enemy = Barracks.new
      damage_taken = 100
      @siege_engine.attack!(enemy)
      expect(enemy.health_points).to eq(500 - damage_taken)
    end

    it "should not attack a Unit that is not a SiegeEngine" do
      enemy = Unit.new(50,50)
      expect(@siege_engine.attack!(enemy)).to be nil
    end
  end

end