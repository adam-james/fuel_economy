class Vehicle < ApplicationRecord
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
end
