require 'rails_helper'

RSpec.describe Priority, type: :model do
  describe "validations" do
    it 'requires a name' do
      expect(Priority.new).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(Priority.new name: 'some name').to be_valid
    end
  end
end
