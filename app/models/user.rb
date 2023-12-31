class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_name, on: :create

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  private

  def set_name
    self.name = "Name №#{rand(777)}" if name.blank?
  end
end
