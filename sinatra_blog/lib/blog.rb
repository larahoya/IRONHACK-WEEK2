require 'pry'
require 'yaml/store'

module StorageFunctions

  def save
    @post_store.transaction do
      @post_store[@name] = @posts
    end
  end

  def load_posts
    posts = YAML.load_file("./public/posts.yml")
    @posts = posts["My blog"]
  end 

end

class Blog

  attr_reader :posts
  include StorageFunctions

  def initialize(name)
    @name = name
    @posts = []
    @post_store = YAML::Store.new('./public/posts.yml')
  end

  def add_post(post)
    @posts << post
  end

  def latest_posts
    @posts = @posts.sort { |post1, post2| post1.date <=> post2.date}
  end

end