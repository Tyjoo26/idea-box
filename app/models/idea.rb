class Idea < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :category
  belongs_to :user

  has_many :uploads
  has_many :pictures, through: :uploads
end
