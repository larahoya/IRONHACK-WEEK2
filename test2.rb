require 'RSpec'

class Fizzbuzz
	def check number
		result = (number % 3 == 0 ? "Fizz" : "") + (number % 5 == 0 ? "Buzz" : "")
		result.empty? ? number.to_s : result
	end
end


RSpec.describe "Fizzbuzz test" do 
	it "return n for n" do
		expect(Fizzbuzz.new.check(1)).to eq("1")
	end
	
	it "returns 'fizz' if n / 3 == 0" do
		expect(Fizzbuzz.new.check(3)).to eq("Fizz")
	end

	it "returns 'buzz' if n / 5 == 0" do
		expect(Fizzbuzz.new.check(5)).to eq("Buzz")
	end

	it "returns 'fizzbuzz' if n / 3 == 0 && n / 5 == 0" do
		expect(Fizzbuzz.new.check(15)).to eq("FizzBuzz")
	end

end