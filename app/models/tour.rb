class Tour < ApplicationRecord
  has_many :views
  has_many :points
  belongs_to :user
end
