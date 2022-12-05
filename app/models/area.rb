class Area < ApplicationRecord
  belongs_to :condo
  has_many :schedules
end
