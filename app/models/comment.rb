class Comment < ApplicationRecord
  belongs_to :blog

  validates :comment, :Name, presence: true
  validates :comment, length: { maximum: 300 }
  validates :Name, length: { maximum:100 }

  scope :newest_first, -> { order(created_at: :desc) }

end
