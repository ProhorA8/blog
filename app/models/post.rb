class Post < ApplicationRecord
  enum status: [:public, :private, :archived], _suffix: :status

  validates :title, :body, presence: true

  belongs_to :user
  has_many_attached :images
end
