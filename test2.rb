
class Fizzbuzz
	def check number
		return "vodafone" if number.to_s[0] == "2"
		return "nike" if number % 7 == 0
		result = (number % 3 == 0 ? "Fizz" : "") + (number % 5 == 0 ? "Buzz" : "")
		result.empty? ? number : result
	end
end