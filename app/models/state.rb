class State < ApplicationRecord
  has_many :tasks

  validates :name, presence: true

  def finished?
    name == 'finished'
  end
end
