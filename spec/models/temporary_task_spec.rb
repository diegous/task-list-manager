require "rails_helper"

RSpec.describe TemporaryTask, :type => :model do
  let(:list) { List.create title: 'list' }
  let(:state) { State.create name: 'pending' }
  let(:priority) { Priority.create name: 'low' }
  let(:start_date) { Date.today }
  let(:end_date) { Date.tomorrow }
  let(:task) { TemporaryTask.new list: list, state: state, priority: priority, description: 'a task', start_date: start_date, end_date: end_date }

  describe "validations" do
    it 'requires a start date' do
      task.start_date = nil
      expect(task).to_not be_valid
    end

    it 'requires an end date' do
      task.end_date = nil
      expect(task).to_not be_valid
    end

    it 'cannot have a percentage' do
      task.percentage = 10
      expect(task).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(task).to be_valid
    end
  end
end
