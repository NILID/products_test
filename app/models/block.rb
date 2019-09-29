class Block < ApplicationRecord
  belongs_to :product

  has_one_attached :img

  MARKS = %w[help service]

  validates_inclusion_of :mark, in: MARKS

  validates :title, :content, :position, presence: true
end
