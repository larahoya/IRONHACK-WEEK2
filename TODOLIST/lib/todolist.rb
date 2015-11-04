require 'rspec'
require 'yaml/store'

module StorageFunctions

  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end

  def load_tasks
    tasks = YAML.load_file("./public/tasks.yml")
    @tasks = tasks["Josh"]
  end 

end

class TodoList

  attr_reader :tasks
  include StorageFunctions

  def initialize(user)
    @todo_store = YAML::Store.new("./public/tasks.yml")
    @user = user
    @tasks = []
  end

  def add_task(task)
    @tasks.push(task)
  end

  def delete_task(input_id)
    @tasks.delete_if {|task| task.id == input_id}
  end

  def find_task_by_id(input_id)
    @tasks.find {|task| task.id == input_id}
  end

  def sort_by_created(order = "ASC")
    if order == "DESC"
      @tasks.sort {|task1,task2| task2.created_at <=> task1.created_at}
    else
      @tasks.sort {|task1,task2| task1.created_at <=> task2.created_at}
    end
  end

end