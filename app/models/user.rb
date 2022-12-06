class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable

  validates :user_name, uniqueness: true, presence: true
  validates :full_name, presence: true

  has_one :condo
  has_one :apartament
  has_many :schedules
  has_one_attached :avatar

  scope :admin_, -> { where(garage: true)}

  scope :user_condo, ->(id) { join(:condo).where(id: id) }

  def self.apartaments_user(user)
    User.where(id: user.condo.apartaments.map(&:user).select(&:id))
  end

end
