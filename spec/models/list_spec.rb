require "rails_helper"

RSpec.describe List, :type => :model do
  let(:list) { List.new }

  describe "validations" do
    it 'requires a title' do
      expect(list).to_not be_valid
    end

    it 'is valid with valid attributes' do
      list.title = 'some title'
      expect(list).to be_valid
    end
  end

  describe "slug" do
    let(:saved_list) { List.create title: 'saved list' }

    it 'generates a slug when saved' do
      list.title = 'some title'
      list.save

      expect(list.slug).to_not be_empty
    end

    it 'generates a different slug in case of conflict' do
      list.title = saved_list.title
      list.save

      expect(list).to be_valid
      expect(list.slug).to_not be_empty
      expect(list.slug).to_not eq saved_list.slug
    end
  end  
end
