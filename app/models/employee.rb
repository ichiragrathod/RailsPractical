class Employee < ApplicationRecord
  validates :employee_name, :email, :password, :gender, :hobbies, 
            :address, :mobile_number, :birth_date, :document, presence: true
  validates :email, uniqueness: true
  HOBBIES = %i[Traveling Computing Cooking Swimming]
end
