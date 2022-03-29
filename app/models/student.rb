class Student < ApplicationRecord
    validate :date_of_birth_cannot_be_in_the_future,
    def date_of_birth_cannot_be_in_the_future
        if date_of_birth.present? && date_of_birth > Date.today
            errors.add(:date_of_birth, "birthdate can't be in future")
        end
    end
    validates :first_name, :last_name, :date_of_birth, presence: true
    validates :terms_of_usage, acceptance: { message: ': You cannot proceed without accepting Terms of Usage' }
    validates :department, :inclusion => { :in => %w(IT CE), :message => "can't be %{value}" }
end
