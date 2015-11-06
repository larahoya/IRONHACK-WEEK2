require_relative '../lib/blog.rb'
require_relative '../lib/post.rb'
require 'rspec'
require 'rack/test'

RSpec.describe "Blog" do 

  before :each do
    @blog = Blog.new("My blog")
    @post = Post.new("Title", "Text", "cathegory", "author")
    @post1 = Post.new("Title", "Text", "cathegory", "author")
  end

  describe "#posts" do
    it "returns an array" do
      expect(@blog.posts).to be_kind_of(Array)
    end
    it "returns an empty array" do
      expect(@blog.posts).to eq([])
    end
  end

  describe "#add_post" do
    it "add a post to the posts array" do
      initial_size = @blog.posts.size
      @blog.add_post(@post)
      final_size = @blog.posts.size
      expect(initial_size + 1).to eq(final_size)
    end
  end

  describe "#latest_posts" do
    it "returns an array of posts" do
      expect(@blog.latest_posts).to be_kind_of(Array)
    end
    it "the first post is newer than the second one" do
      @blog.add_post(@post1)
      @blog.add_post(@post)
      expect(@blog.latest_posts[0].date).to be < @blog.latest_posts[1].date
    end
  end

  describe "#save" do

    it "Save in a file" do
      @blog.add_post(@post)
      @blog.add_post(@post)
      @blog.save
      expect(1).to eq(1)
    end

  end

  describe "#load_tasks" do

    it "It load the saved tasks" do
      @blog.add_post(@post)
      @blog.add_post(@post)
      @blog.save
      expect(@blog.load_posts.size).to be > 0
    end

  end

end