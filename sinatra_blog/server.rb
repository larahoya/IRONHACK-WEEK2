require 'sinatra'
require 'pry'
require_relative './lib/blog.rb'
require_relative './lib/post.rb'

blog = Blog.new("My blog")
blog.load_posts

get '/' do
  @posts = blog.posts
  erb(:index)
end

get '/post_details/:id' do
  post_number = params[:id].to_i
  posts = blog.posts
  @post = posts[post_number]
  erb(:post_details)
end

get '/new_post' do
  erb(:new_post)
end

post '/create_post' do
  title = params[:title]
  text = params[:text]
  cathegory = params[:cathegory]
  author = params[:author]
  blog.add_post(Post.new(title, text, cathegory, author))
  blog.save
  redirect("/")
end