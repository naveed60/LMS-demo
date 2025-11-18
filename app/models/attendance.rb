class Attendance < ApplicationRecord
  belongs_to :enrollment

  validates :date, presence: true
  validates :status, presence: true
end

