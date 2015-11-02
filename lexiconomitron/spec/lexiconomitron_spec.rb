require 'RSpec'
require_relative '../lexiconomitron.rb'

RSpec.describe "Lexiconomitron" do
  
  describe "#eat_t" do
    it "returns the same string if there is no t" do
      @lexi = Lexiconomitron.new
      expect(@lexi.eat_t("a")).to eq("a")
    end

    it "returns an empty string if the input is t" do
      @lexi = Lexiconomitron.new
      expect(@lexi.eat_t("t")).to eq("")
    end

    it "removes every letter t from the input" do
      @lexi = Lexiconomitron.new
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end

    it "removes every letter T from the input" do
      @lexi = Lexiconomitron.new
      expect(@lexi.eat_t("Time to code!")).to eq("ime o code!")
    end
  end

  describe "#reverse_string_in_array" do
    it "returns the input reversed" do
      @lexi = Lexiconomitron.new
      expect(@lexi.reverse_string_in_array(["test"])).to eq(["tset"])
    end
  end

  describe "#first_and_last_word" do
    it "It returns the first and last word of an array" do
      @lexi = Lexiconomitron.new
      expect(@lexi.first_and_last_word(["a","b","c"])).to eq(["a","c"])
    end
  end

  describe "#shazam" do
    it "returns the first and last item in the input reversed and without t's" do
      @lexi = Lexiconomitron.new
      expect(@lexi.shazam(["test", "tom", "second", "class"])).to eq(["se", "ssalc"])
    end
  end

  describe "#three_or_less" do
    it "It takes an array and returns the words with length of three or less" do
      @lexi = Lexiconomitron.new
      expect(@lexi.three_or_less(["if","you","wanna","be","my","lover"])).to eq(["if","you","be","my"])
    end
  end

  describe "#oompa_loompa" do
    it "It takes an array and returns the words with length of three or less without t's" do
      @lexi = Lexiconomitron.new
      expect(@lexi.oompa_loompa(["if","you","wanna","be","my","lover", "tea"])).to eq(["if","you","be","my", "ea"])
    end
  end

end