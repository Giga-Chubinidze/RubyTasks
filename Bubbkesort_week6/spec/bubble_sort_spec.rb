require 'bubble_sort'

RSpec.describe BubbleSort do
  arr = [4, 3, 78, 2, 0, 2]
  let(:bubblesort) { BubbleSort.new([4, 3, 78, 2, 0, 2])}

  context BubbleSort do
    it "should sort the array" do
      expect(bubblesort.call).to eq(arr.sort)
    end
  end

  context BubbleSort do
    let(:bubblesort) { BubbleSort.new([])}

    it "should return the empty array" do
      expect(bubblesort.call).to eq([])
    end
  end

  context BubbleSort do 
    let(:bubblesort) { BubbleSort.new([4, 3, "some string", 2, 0, 2])}

    it "should give an IO error" do 
      expect(bubblesort.call).to eq("Invalid Input")
    end
  end
end