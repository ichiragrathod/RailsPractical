class Faculty < ApplicationRecord
    validate :date_of_birth_cannot_be_in_the_future,

    def date_of_birth_cannot_be_in_the_future
        if date_of_birth.present? && date_of_birth > Date.today
            errors.add(:date_of_birth, "birthdate can't be in future")
        end
    end
    
    validates :first_name, :last_name, :date_of_birth, :phone_number, presence: true
    validates :phone_number,numericality: { only_integer: true }, length:{is:10} 

    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true,uniqueness:{case_sensitive:false}

    validates :designation,
                :inclusion => { :in => %w(Ass.Prof Prof),:message => "can't be %{value}" },
                :exclusion => { :in => %w(HOD Sr.Prof.),:message => "%{value} is reserved." }

end