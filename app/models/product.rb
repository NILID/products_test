class Product < ApplicationRecord
  has_many :blocks, inverse_of: :product

  DOMAINS = %i[Alfa Sigma]
  DEVICES = %i[Desktop Notebook Tablet Mobile]
  OS      = %i[Windows MacOS]

  validates :title, presence: true
  validates_inclusion_of :domain, in: DOMAINS, allow_nil: true
  validates_inclusion_of :device, in: DEVICES, allow_nil: true
  validates_inclusion_of :os,     in: OS, allow_nil: true

  accepts_nested_attributes_for :blocks, reject_if: :all_blank, allow_destroy: true
end
