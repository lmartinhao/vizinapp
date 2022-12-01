class Note < ApplicationRecord
  belongs_to :condo
  belongs_to :note_category
  has_one_attached :file
end
