class Product < ApplicationRecord
  has_many :blocks, inverse_of: :product

  DOMAINS = %i[Alfa Sigma]
  DEVICES = %i[Desktop Notebook Tablet Mobile]
  OS = %i[Windows MacOS]

  validates :title, :desc, presence: true

  accepts_nested_attributes_for :blocks, reject_if: :all_blank, allow_destroy: true
end
