require 'rspec'
require 'array'

describe 'my_unique' do
  let(:array) { [1,2,5,3,1,2,6] }
  let(:unique_array) { my_unique(array.dup) }

  it "removes duplicate elements in an array" do
    array.each do |el|
      expect(unique_array.count(el)).to eq(1)
    end
  end

  it "only contains items from the original array" do
    unique_array.each do |item|
      expect(array).to include(item)
    end
  end

  it "does not modify the original array" do
    expect {
      my_unique(array)
    }.to_not change{array}
  end
end

describe "two_sum" do
  let(:array) { [6, 8, 2, -6, 3] }
  let(:one_zero) { [7, 9, 0, 2, 5] }
  let(:two_zeros) { [2, 0, 3, 0, 1] }

  it "finds a pair that sums to zero" do
    expect(two_sum(array)).to eq([[0, 3]])
  end

  it "handles a zero" do
    expect(two_sum(one_zero)).to eq([])
  end

  it "handles two zeros" do
    expect(two_sum(two_zeros)).to eq([[1, 3]])
  end
end

describe "my_transpose" do
  it "transposes a matrix" do
    
    matrix = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]

    expect(my_transpose(matrix)).to eq([
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ])
  end
end


describe "stock_picker" do
  it "finds a good pair" do
    expect(stock_picker([3, 1, 0, 4, 6, 9])).to eq([2, 5])
  end

  it "finds a better pair after an lower pair" do
    expect(stock_picker([3, 2, 5, 0, 6])).to eq([3, 4])
  end

  it "does not buy stocks if there are no good options" do
    expect(stock_picker([7,4,2,1])).to be_nil
  end

end
