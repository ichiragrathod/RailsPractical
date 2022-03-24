class Employee < ApplicationRecord

    #Validation Code here...
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,uniqueness:{case_sensitive:false}, 
    length: {minimum:3, maximum:105},
    format:{ with:VALID_EMAIL_REGEX }
    validates :first_name, :last_name, :email, :age, :salary, presence: true
    validates :age, :no_of_order, numericality: {only_integer: true}

    #Lock Method Defined here for Update the Record
    def update_with_conflict_validation(*args)
        update(*args)
    rescue ActiveRecord::StaleObjectError
        self.lock_version = lock_version_was
        errors.add :base, "This record changed while you were editing."
        changes.except("updated_at").each do |name, values|
            errors.add name, "was #{values.first}"
        end
        false
    end
end
