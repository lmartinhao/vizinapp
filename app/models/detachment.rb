class Detachment < ApplicationRecord
  belongs_to :apartament
  belongs_to :detachment_category

  has_one_attached :photo
  validates :title, length: { maximum: 22 }
end
