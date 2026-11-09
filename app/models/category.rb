class Category < ApplicationRecord
  has_many :attractions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end