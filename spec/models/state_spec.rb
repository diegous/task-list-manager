require "rails_helper"

RSpec.describe State, :type => :model do
  describe "validations" do
    it 'requires a name' do
      expect(State.new).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(State.new name: 'some name').to be_valid
    end
  end
end
