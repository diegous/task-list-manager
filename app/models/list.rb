class List < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :tasks

  validates :title, presence: true
end
