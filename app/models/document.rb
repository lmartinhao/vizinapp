class Document < ApplicationRecord
  belongs_to :condo
  belongs_to :document_category
  has_one_attached :document_file
end
