class Meeting < ApplicationRecord
  validates :name, :start_datetime, :end_datetime, :user, presence: true
end
