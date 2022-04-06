class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :email, presence: true,uniqueness:{case_sensitive:false}
  validates :fname, :lname, :phone_number, presence: true
end
