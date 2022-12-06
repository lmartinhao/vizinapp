class Area < ApplicationRecord
  belongs_to :condo
  belongs_to :area_category
  has_many :schedules

  scope :has_area, ->(id) { where(condo_id: id) }
end
