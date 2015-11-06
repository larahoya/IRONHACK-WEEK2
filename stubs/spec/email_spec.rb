require 'RSpec'
require_relative '../email.rb'


RSpec.describe EmailProviderFake do

  describe "email provider has no strings" do

    it "should return true if no words given" do
      provider = EmailProviderFake.new([])
      counter = WordCounter.new(provider)
      expect(counter.check([])).to eq(true)
    end

    it "should return false when a word is included" do
      provider = EmailProviderFake.new([])
      counter = WordCounter.new(provider)
      expect(counter.check(["hola"])).to eq(false)
    end

  end

  describe "email provider has strings" do

    it "should return true when a word is included in a subject" do
      provider = EmailProviderFake.new(["hola"])
      counter = WordCounter.new(provider)
      expect(counter.check(["hola"])).to eq(true)
    end

    it "should return false when a word is no included" do
      provider = EmailProviderFake.new(["hola"])
      counter = WordCounter.new(provider)
      expect(counter.check(["adios"])).to eq(false)
    end

    it "should return false when a word is no included" do
      provider = EmailProviderFake.new(["hola ruben", "adios ruben"])
      counter = WordCounter.new(provider)
      expect(counter.check(["hola","adios"])).to eq(true)
    end

  end

end