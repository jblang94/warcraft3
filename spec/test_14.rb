require_relative 'spec_helper'

describe Barracks do 
  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 500 lumber" do
    expect(@barracks.lumber).to eql(500)
  end

  describe '#build_siege_engine' do
    it "costs 200 gold" do
      cost = 200
      @barracks.build_siege_engine
      expect(@barracks.gold).to eql(1000 - cost)
    end

    it "costs 3 food" do
      cost = 3
      @barracks.build_siege_engine
      expect(@barracks.food).to eql(80 - cost)
    end

    it "costs 60 lumber" do
      cost = 60
      @barracks.build_siege_engine
      expect(@barracks.lumber).to eql(500 - cost)
    end
  end

  describe '#can_build_siege_engine?' do
    it "returns false if there is not enough gold" do
      @barracks.stub(:gold) { 0 }
      expect(@barracks.can_build_siege_engine?).to be false
    end

    it "returns false if there is not enough food" do
      @barracks.stub(:food) { 0 }
      expect(@barracks.can_build_siege_engine?).to be false
    end

    it "returns false if there is not enough lumber" do
      @barracks.stub(:lumber) { 0 }
      expect(@barracks.can_build_siege_engine?).to be false
    end

    it "returns true if there are enough resources" do
      expect(@barracks.can_build_siege_engine?).to be true
    end
  end 

  describe "#build_siege_engine" do
    it "does not build a siege engine if there are not enough resources" do
      @barracks.stub(:gold) { 0 }
      @barracks.stub(:food) { 0 }
      @barracks.stub(:lumber) { 0 }
      expect(@barracks.build_siege_engine).to be nil
    end

    it "builds a siege engine if there are enough resources" do
      expect(@barracks.build_siege_engine).to be_a(SiegeEngine)
    end
  end

end