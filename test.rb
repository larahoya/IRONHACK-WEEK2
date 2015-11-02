require 'RSpec'

class StringCalculator

  def add(number_string)
    number_string.gsub("\n", ",").split(",").reduce(0) do |sum, n|
      sum = sum + n.to_i
    end
  end

end


RSpec.describe "String Calculator" do
	
	before :each do
		@calculator = StringCalculator.new
	end

	it "returns 0 for empty string" do
		expect(@calculator.add("")).to eq(0)
	end

	it "returns 3 for only that number" do
		expect(@calculator.add("3")).to eq(3)
	end

	it "returns 4 for 2\n2" do
		expect(@calculator.add("2\n2")).to eq(4)
	end

	it "returns 8 for 2,2,2,2" do
		expect(@calculator.add("2,2,2,2")).to eq(8)
	end

end