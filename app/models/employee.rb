class Employee < ApplicationRecord
  validates :employee_name, :email, :password, :gender, :hobbies, 
            :address, :mobile_number, :birth_date, :document, presence: true
  validates :email, uniqueness: true
  HOBBIES = %i[Traveling Computing Cooking Swimming]

  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true
  has_one_attached :document
end
