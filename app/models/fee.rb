class Fee < ApplicationRecord
  belongs_to :student

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true
end

