class Product < ApplicationRecord
  has_many :help_blocks, -> { where(mark: 'help') }, class_name: 'Block', inverse_of: :product
  has_many :service_blocks, -> { where(mark: 'service') }, class_name: 'Block', inverse_of: :product
  has_and_belongs_to_many :users

  DOMAINS = %w[Alfa Sigma]
  DEVICES = %w[Desktop Notebook Tablet Mobile]
  OS      = %w[Windows MacOS]

  validates :title, presence: true
  validates_inclusion_of :domain, in: DOMAINS, allow_blank: true
  validates_inclusion_of :device, in: DEVICES, allow_blank: true
  validates_inclusion_of :os,     in: OS,      allow_blank: true
  validates_length_of :users, maximum: 3, too_long: I18n.t('messages.command_to_much', count: count)
  validates :help_blocks,    length: { minimum: 2, maximum: 4 }
  validates :service_blocks, length: { minimum: 2, maximum: 5 }

  accepts_nested_attributes_for :help_blocks, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :service_blocks, reject_if: :all_blank, allow_destroy: true
end
