class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :uploads
  has_many :ideas, through: :uploads
end
