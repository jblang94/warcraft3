require_relative 'spec_helper'

# Tests the initial value of Barracks health points
# Tests the #damage method of Barracks
describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 500 health points" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the Barrack's health points by half of the Footman's attack power" do
      @footman = Footman.new
      damage_taken = (Footman::MAX_ATTACK_POWER/2).ceil
      expect(@barracks).to receive(:damage).with(damage_taken)
      @footman.attack!(@barracks)
    end
  end

end