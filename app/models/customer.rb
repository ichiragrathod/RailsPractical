class Customer < ApplicationRecord
    validates :email, presence: true,uniqueness:{case_sensitive:false}
    validates :fname, :lname, :phone_number, presence: true
end
