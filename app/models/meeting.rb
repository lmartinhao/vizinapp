class Meeting < ApplicationRecord
  belongs_to :area
  belongs_to :user

  validates :area_id, :schedule_date, presence: true
  validates :schedule_date, uniqueness: { scope: :area_id,
    message: "Área já reservada para esta data" }
end
