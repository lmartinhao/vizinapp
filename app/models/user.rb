class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, uniqueness: true, presence: true
  validates :full_name, presence: true

  belongs_to :condo

  def admin?
    self.admin
  end
end
