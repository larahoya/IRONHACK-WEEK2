require 'RSpec'
require_relative '../test2.rb'

RSpec.describe "Fizzbuzz test" do 
	it "return n for n" do
		expect(Fizzbuzz.new.check(1)).to eq(1)
	end
	
	it "returns 'fizz' if n is 3" do
		expect(Fizzbuzz.new.check(3)).to eq("Fizz")
	end

	it "returns 'buzz' if n is 5" do
		expect(Fizzbuzz.new.check(5)).to eq("Buzz")
	end

	it "returns 'fizzbuzz' if n / 3 == 0 && n / 5 == 0" do
		expect(Fizzbuzz.new.check(15)).to eq("FizzBuzz")
	end

	it "returns 'nike' if n == 7" do
		expect(Fizzbuzz.new.check(7)).to eq("nike")
	end

	it "returns 'nike' if n / 7 == 0" do
		expect(Fizzbuzz.new.check(14)).to eq("nike")
	end

	it "returns 'vodafone' if it starts with 2" do
		expect(Fizzbuzz.new.check(2)).to eq("vodafone")
	end

end