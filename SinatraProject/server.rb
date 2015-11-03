require "sinatra"

get "/" do
  " "
end

get "/about" do
  " "
end

get "/author" do
  @time = Time.now.strftime("%H:%M:%S")
  @ingredients = ["cheese", "pepperoni", "mushrooms"]
  erb(:author)
end

get "/users/:username" do
  @username = params[:username]
  erb(:user_profile)
end

get "/hours/ago/:hours" do
  hours = params[:hours]
  @new_hour = (Time.now - hours.to_i*3600).strftime("%H:%M")
  erb(:hours_ago)
end