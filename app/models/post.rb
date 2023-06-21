class Post < ApplicationRecord
  enum status: { public: 0, private: 1, archived: 2 }, _suffix: :status

  validates :title, :body, presence: true

  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
end
