require_relative '../conways.rb'
require 'RSpec'

RSpec.describe Cell do

  describe "#alive?" do

    it "returns true if cell state = 1" do
      @cell = Cell.new(1,[0,0,0,0,0,0,0,0])
      expect(@cell.alive?).to be true
    end

    it "returns false if cell state = 0" do
      @cell = Cell.new(0,[0,0,0,0,0,0,0,0])
      expect(@cell.alive?).to be false
    end

  end

  describe "#regenerate" do

    it "regenerates a dead cell from a dead cell if it has 0 neighbours" do
      @cell = Cell.new(0,[0,0,0,0,0,0,0,0])
      expect(@cell.regenerate).to eq(0)
    end

    it "regenerates a dead cell from a dead cell if it has less than 3 neighbours" do
      @cell = Cell.new(0,[0,0,0,0,0,0,1,1])
      expect(@cell.regenerate).to eq(0)
    end

    it "regenerates a dead cell from a dead cell if it has more than 3 neighbours" do
      @cell = Cell.new(0,[0,0,0,0,1,1,1,1])
      expect(@cell.regenerate).to eq(0)
    end

    it "regenerates a live cell from a dead cell if it has 3 neighbours" do
      @cell = Cell.new(0,[0,0,0,0,0,1,1,1])
      expect(@cell.regenerate).to eq(1)
    end

    it "regenerates a dead cell from a live cell if it has less than 3 neighbours" do
      @cell = Cell.new(1,[0,0,0,0,0,0,1,1])
      expect(@cell.regenerate).to eq(0)
    end

  end

end