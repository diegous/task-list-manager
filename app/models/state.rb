class State < ApplicationRecord
  has_many :tasks

  validates :name, presence: true

  def pending?
    name == 'pending'
  end

  def in_progress?
    name == 'in_progress'
  end

  def finished?
    name == 'finished'
  end

  def expired?
    name == 'expired'
  end
end
