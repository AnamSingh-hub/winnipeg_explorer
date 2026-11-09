class Attraction < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :address, presence: true
  validates :entry_fee,
            numericality: { greater_than_or_equal_to: 0 }
end