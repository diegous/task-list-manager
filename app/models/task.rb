class Task < ApplicationRecord
  belongs_to :list
  belongs_to :state
  belongs_to :priority

  validates :list, presence: true
  validates :state, presence: true
  validates :priority, presence: true

  validates :description, presence: true

  def partial_name
    type.underscore
  end
end
