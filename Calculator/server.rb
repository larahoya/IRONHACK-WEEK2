require 'sinatra'

get "/" do
  "Hello World! Welcome to our calculator!"
end

get "/add" do
  erb(:add)
end

post "/calculate-add" do
  @numbers = params.inspect
  "Params data: " + @numbers
end