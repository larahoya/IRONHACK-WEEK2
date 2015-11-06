require_relative '../lib/post.rb'
require 'rspec'
require 'rack/test'

RSpec.describe "Post" do

  describe "#title" do
    it "returns the title of the post" do
      @post = Post.new("Post", "text", "cathegory", "author")
      expect(@post.title).to eq("Post")
    end
  end

  describe "#text" do
    it "returns the text of the post" do
      @post = Post.new("Post", "text", "cathegory", "author")
      expect(@post.text).to eq("text")
    end
  end

  describe "#date" do
    it "returns the text of the post" do
      @post = Post.new("Post", "text", "cathegory", "author")
      expect(@post.date.strftime("%H:%M")).to eq(Time.now.strftime("%H:%M"))
    end
  end

end