class Apartament < ApplicationRecord
  belongs_to :condo
  belongs_to :user

  accepts_nested_attributes_for :user

  scope :all_by_condo, ->(id) { where(condo_id: id) }
  scope :have_garage, -> { where(garage: true) }
  scope :has_condo, ->(id) { where(condo_id: id) }
end
