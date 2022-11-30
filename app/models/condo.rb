class Condo < ApplicationRecord
  belongs_to :uf

  validates :name, :address, :city, :uf, presence: true
  validates :name, uniqueness: { scope: [:address, :city], message: "Endereço duplicado" }
end
