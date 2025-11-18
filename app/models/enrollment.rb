class Enrollment < ApplicationRecord
  belongs_to :semester
  belongs_to :section 
  belongs_to :student
  belongs_to :grade

  has_many :attendances, dependent: :destroy
end
