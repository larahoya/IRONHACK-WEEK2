
require_relative '../sinatra.rb'

RSpec.describe "Task" do 

  before :each do
      @task = Task.new("Walk the dog")
    end
  
  describe "#initialize" do

    it "The id of the first intance is 1" do
      expect(@task.id).to eq(1)
    end

    it "The id of the second task is 2" do
      expect(@task.id).to eq(2)
    end

    it "The completed instance attribute is false by default" do
      expect(@task.completed).to be(false)
    end

    it "The created_at attribute is set with the current time" do
      expect(@task.created_at.strftime("%H:%M:%S")).to eq(Time.now.strftime("%H:%M:%S"))
    end

  end

  describe "#complete?" do

    it "It returns false by default" do
      expect(@task.complete?).to be(false)
    end

  end

  describe "#complete!" do

    it "It changes the state of the completed attribute to true" do
      @task.complete!
      expect(@task.completed).to be(true)
    end
  
  end

  describe "#make_incomplete!" do

    it "It changes the state of the completed attribute to false" do
      @task.make_incomplete!
      expect(@task.completed).to be(false)
    end

  end

  describe "#update_content!" do

    it "It changes the content attribute" do
      first_value = @task.content
      @task.update_content!("Buy milk")
      expect(@task.content).not_to be(first_value)
    end

    it "It changes the updated_at attribute to the current time" do
      @task.update_content!("Buy milk")
      expect(@task.updated_at.strftime("%H:%M:%S")).to eq(Time.now.strftime("%H:%M:%S"))
    end
  
  end

end