require 'hanoi'
require 'rspec'

describe TowersOfHanoi do
  subject(:towers) { TowersOfHanoi.new }

  it "initializes default stacks" do
    expect(towers.stacks).to eq([[3,2,1], [], []])
  end

  describe "#render" do
    it "displays each stack" do
      expect(towers.render).to eq("Tower 0:  3  2  1\nTower 1:  \nTower 2:  \n")
    end

    it "displays stacks of different height" do
      new_towers = TowersOfHanoi.new([[3,2], [1], []])
      expect(new_towers.render).to eq("Tower 0:  3  2\nTower 1:  1\nTower 2:  \n")
    end
  end

  describe "#move" do
    it "allows a move to an empty tower" do
      towers.move(0, 1)
      expect(towers.stacks).to eq([[3,2], [1], []])
    end
    it "allows a move to a tower with a larger disk" do
      towers = TowersOfHanoi.new([[3], [2,1], []])
      towers.move(1, 0)
      expect(towers.stacks).to eq([[3,1], [2], []])
    end
    it "does not allow a move to a tower with a smaller disk" do
      towers = TowersOfHanoi.new([[3], [2,1], []])
      expect do
        towers.move(0, 1)
      end.to raise_error("cannot move onto smaller disk")
    end
    it "does not allow a move from an empty tower" do
      expect do
        towers.move(2, 1)
      end.to raise_error("cannot move from empty tower")
    end

  end

  describe "#won?" do
    it "determines if the game is not over" do
      expect(towers).not_to be_won
    end

    it "determines if the game is over" do
      towers = TowersOfHanoi.new([[], [], [3,2,1]])
      expect(towers).to be_won
    end
  end
end
