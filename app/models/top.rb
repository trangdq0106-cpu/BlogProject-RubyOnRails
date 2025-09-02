class TopController < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :image, presence: true
  # Scopes
  default_scope {order(created_at: :desc)}
  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
  scope :description_includes, ->(keyword) { where("description LIKE ?", "%#{keyword}%") }
end
