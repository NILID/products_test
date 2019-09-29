class Block < ApplicationRecord
  belongs_to :product

  has_one_attached :img

  validates :title, :content, :position, presence: true
end
