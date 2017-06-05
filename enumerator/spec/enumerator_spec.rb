require './lib/enumerator'

describe Enumerable do
  let(:array) { [1, 2, 3] }
  let(:array2) { [1, 2, "hello"]}
  let(:array3) { ["hello", "how", "are", "you"]}
  let(:new_array) { [] }

  describe "my_each" do
    it 'iterates through each element passed in' do
      expect { |block|  array.my_each(&block) }.to yield_successive_args(1, 2, 3)
    end

    it 'correctly applies block to each element' do
      array.my_each { |i| new_array.push i * 4 }
      expect(new_array).to eq( [4, 8, 12] )
    end
  end

  describe "my_all?" do
    it 'returns true if all elements are integers' do
      expect(array.my_all? { |i| i.is_a? Integer }).to eq(true)
    end
    it 'returns true if all elements are strings' do
      expect(array3.my_all? { |i| i.is_a? String }).to eq(true)
    end
    it 'returns false if one or more element(s) is not an integer' do
      expect(array2.my_all? { |i| i.is_a? Integer }).to eq(false)
    end
  end

  describe "my_any?" do
    it 'returns true if any element is an integer' do
      expect(array2.my_any? { |i| i.is_a? Integer}).to eq(true)
    end
    it 'returns false if no element is an integer' do
      expect(array3.my_any? { |i| i.is_a? Integer}).to eq(false)
    end
  end

  describe "my_none?" do
    it 'returns true if any element is not greater than 4' do
      expect(array.my_none? { |i| i > 4 }).to eq(true)
    end
    it 'returns false if any element is less than 4' do
      expect(array.my_none? { |i| i < 4 }).to eq(false)
    end
  end
end
