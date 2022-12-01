class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :user_name, uniqueness: true, presence: true
  validates :full_name, presence: true

  has_one :condo
  has_one :apartament

  scope :admin_, -> { where(garage: true)}
  scope :user_condo, ->(id) { where(id: id) }

  def admin?
    self.admin
  end
end
