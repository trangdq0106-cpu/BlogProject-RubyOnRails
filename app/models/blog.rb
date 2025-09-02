class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy

  validates :title, :shortdescription, :description, presence: true
  validates :title,
    :presence => true,
    :length => { :maximum => 100 }

  validates :shortdescription,
    :presence => true,
    :length => { :maximum => 300 }

  validates :description,
    :presence => true,
    :length => { :maximum => 500 }

  validates :description,
    :presence => true,
    :length => { :maximum => 500 }

  # validates :image_size, presence: true

  default_scope {order(created_at: :desc)}
  scope :unpublished, -> { where(published: false) }
  scope :published, -> { where(published: true) }
  scope :description_includes, ->(keyword) { where("description LIKE ?", "%#{keyword}%") }

  def image_size
    if (image.size > 1.megabytes)
      errors.add(:image, "Image size within 1 megabytes")
    end
  end
end
