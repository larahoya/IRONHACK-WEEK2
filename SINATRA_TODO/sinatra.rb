require 'rspec'
require 'yaml/store'

module StorageFunctions

  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end

  def load_tasks
    YAML::load("./public/tasks.yml")
  end 

end

class Task

  attr_reader :content, :id, :completed, :created_at, :updated_at
  @@current_id = 1
  
  def initialize (content, completed = false)
    @id = @@current_id
    @content = content
    @completed = completed
    @created_at = Time.now
    @updated_at = nil
    @@current_id += 1
  end

  def complete?
    @completed
  end

  def complete!
    @completed = true
  end

  def make_incomplete!
    @completed = false
  end

  def update_content!(new_content)
    @content = new_content
    @updated_at = Time.now
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