class Meeting < ApplicationRecord
  belongs_to :area
  belongs_to :user

  validates :area_id, :schedule_date, presence: true
  validates :schedule_date, uniqueness: { scope: :area_id,
                                          message: "já foi escolhida para esta área" }
  validates :schedule_date, comparison: { greater_than: (Date.tomorrow + 1),
                                          message: "precisa ser de, no mínimo, 3 dias depois de hoje" }
end
