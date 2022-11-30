class Apartament < ApplicationRecord
  belongs_to :condo
  belongs_to :user
end
