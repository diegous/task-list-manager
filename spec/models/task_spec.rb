require "rails_helper"

RSpec.describe Task, :type => :model do
  let(:list) { List.create title: 'list' }
  let(:state) { State.create name: 'pending' }
  let(:priority) { Priority.create name: 'low' }
  let(:task) { Task.new list: list, state: state, priority: priority, description: 'a task' }

  describe "validations" do
    it 'requires a list' do
      task.list = nil
      expect(task).to_not be_valid
    end

    it 'requires a state' do
      task.state = nil
      expect(task).to_not be_valid
    end

    it 'requires a title' do
      task.description = nil
      expect(task).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(task).to be_valid
    end
  end
end
