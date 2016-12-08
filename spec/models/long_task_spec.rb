require "rails_helper"

RSpec.describe LongTask, :type => :model do
  let(:list) { List.create title: 'list' }
  let(:state) { State.create name: 'pending' }
  let(:expired) { State.create name: 'expired' }
  let(:priority) { Priority.create name: 'low' }
  let(:task) { LongTask.new list: list, state: state, priority: priority, description: 'a task', percentage: 10 }

  describe "validations" do
    it 'requires a percentage' do
      task.percentage = nil
      expect(task).to_not be_valid
    end

    it 'cannot have a start date' do
      task.start_date = Date.today
      expect(task).to_not be_valid
    end

    it 'cannot have an end date' do
      task.end_date = Date.tomorrow
      expect(task).to_not be_valid
    end

    it 'cannot have an "expired" state' do
      task.state = State.find_by(name: expired.name)
      expect(task).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(task).to be_valid
    end
  end
end
