class Task < ApplicationRecord
  belongs_to :list
  belongs_to :state
  belongs_to :priority

  validates :list, presence: true
  validates :state, presence: true
  validates :priority, presence: true

  validates :description, presence: true

  validate :valid_state

  def partial_name
    type.underscore
  end

  def simple?
    type == 'SimpleTask'
  end

  def long_task?
    type == 'LongTask'
  end

  def temporary_task?
    type == 'TemporaryTask'
  end

  def expired?
    false
  end

  def valid_states
    ['pending', 'finished']
  end

  private

  def valid_state
    unless state.nil?
      errors.add(:state, "invalid for this type of task") unless valid_states.include?(state.name)
    end
  end
end
