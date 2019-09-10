class Photo < ApplicationRecord

  belongs_to :post

  # imageが必ず存在するようにvalidatesをかける
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
