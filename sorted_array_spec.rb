require 'rspec'
require './sorted_array.rb'

#shared example is like a method for calling methods, its like a rspec method for testing common functionality
shared_examples "yield to all elements in sorted array" do |method|
    specify do 
      expect do |b| 
        sorted_array.send(method, &b) 
      end.to yield_successive_args(2,3,4,7,9) 
    end
end

describe SortedArray do
  let(:source) { [2,3,4,7,9] }
  let(:sorted_array) { SortedArray.new source }

  describe "iterators" do
    describe "that don't update the original array" do 
      describe :each do
        context 'when passed a block' do
          it_should_behave_like "yield to all elements in sorted array", :each
        end

        it 'should return the array' do
          sorted_array.each {|el| el }.should eq source
        end
      end

      describe :map do
        it 'the original array should not be changed' do
          original_array = sorted_array.internal_arr
          expect { sorted_array.map {|el| el } }.to_not change { original_array }
        end

        it_should_behave_like "yield to all elements in sorted array", :map

        it 'creates a new array containing the values returned by the block' do
          #pending "fill this spec in with a meaningful example"
        sorted_array.map {|el| el }.should eq source        end
      end
    end

    describe "that update the original array" do
      describe :map! do

        it 'the original array should be updated' do
          original_array= sorted_array.internal_arr 
          expect {sorted_array.map! {|el| el} } !=  original_array
        end

        it_should_behave_like "yield to all elements in sorted array", :map!

        it 'should replace value of each element with the value returned by block' do
      sorted_array.map! {|el| el}.should eq source  
        end
      end
    end
  end

  describe :find do

#take a block, return array, 
#23479 find takes block, test for equality, block returns true when u hit the element ur looking at
#compares succ element sin array against whatever u want to compare, then it stops yielding
    it "" do
      sorted_array.find {|x| x + 1== 3 }.should eq(2)
      string_array = SortedArray.new(["Amy", "Andrea"])
      string_array.find {|x| x[0] == "A"}.should eq("Amy")
    end
  end

  describe :inject do
    # 2,3,4,7,9

    # specify do
    #   expect do |b|
    #     block_with_two_args= Proc.new{|acc, el| return true}
    #     sorted_array.send
    it "" do
    sorted_array.inject(0) {|sum, x| sum + x}.should eq(25)
    end
  end
end
