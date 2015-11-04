require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require 'yaml/store'
require_relative './lib/task.rb'
require_relative './lib/todolist.rb'

todo_list = TodoList.new("Josh")
todo_list.load_tasks


get "/"do 
  @tasks = todo_list.tasks
  erb(:task_index)
end

get "/new_task" do
  erb(:new_task)
end

post "/create_task" do
  new_content = params[:content]
  new_task =  Task.new(new_content)
  todo_list.add_task(new_task)
  todo_list.save
  redirect("/")
end

get "/complete_task/:id" do
  input_id = params[:id].to_i
  @task = todo_list.find_task_by_id(input_id)
  @task.complete!
  todo_list.save
  redirect("/")
end

get "/incomplete_task/:id" do
  input_id = params[:id].to_i
  @task = todo_list.find_task_by_id(input_id)
  @task.make_incomplete!
  todo_list.save
  redirect("/")
end

get "/delete_task/:id" do
  input_id = params[:id].to_i
  todo_list.delete_task(input_id)
  todo_list.save
  redirect("/")
end
