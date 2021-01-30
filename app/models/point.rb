class Point < ApplicationRecord
  has_many :views
  has_many :visits
  belongs_to :user
  belongs_to :tour
end
