class Micropost < ApplicationRecord
  belongs_to :user
  scope :newest_first, -> {order created_at: :desc}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, t(".less_than")
    end
  end
end
