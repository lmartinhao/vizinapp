class Condo < ApplicationRecord
  belongs_to :uf
  belongs_to :user

  validates :name, :address, :city, :uf, presence: true
  validates :name, uniqueness: { scope: [:address, :city], message: "Endereço duplicado" }
end
