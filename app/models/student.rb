class Student < ApplicationRecord
    validate :date_of_birth_cannot_be_in_the_future,

    def date_of_birth_cannot_be_in_the_future
        if date_of_birth.present? && date_of_birth > Date.today
            errors.add(:date_of_birth, "birthdate can't be in future")
        end
    end
    
    validates :first_name, :last_name, :date_of_birth, presence: true
    validates :terms_of_usage, acceptance: { message: ': You cannot proceed without accepting Terms of Usage' }
    validates :department, :inclusion => { :in => %w(IT CE),
        :message => "can't be %{value}" }

    
    #Callbacks code here...
    
    before_validation :normalize_name, :remove_whitespaces

    after_initialize do |student|
        puts "You have initialized an student!"
    end

    after_find do |student|
        puts "You have found an student!"
    end

    after_create do |student|
        puts "Student #{student.first_name} #{student.last_name} has been created."
    end
    
    after_update do |student|
        puts "Student #{student.first_name} #{student.last_name} has been updated."
    end

    after_destroy do |student|
        puts "Student #{student.first_name} #{student.last_name} has been destroyed."
    end

    before_validation :check_date_of_birth, if: Proc.new { |student| student.errors[:date_of_birth] == []}

    def check_date_of_birth
        puts "Student Date of birth is Vaild."
    end

    after_destroy :not_allowed_name, if: Proc.new { |student| student.first_name.downcase == "abc" or student.first_name.downcase == "xyz" or student.first_name.downcase == "temp"}
    
    def not_allowed_name
        puts "#{self.first_name} is deleted, beacuse it's not allowed!"
    end

    def remove_whitespaces
        self.first_name.strip!
        self.last_name.strip!
    end

    def normalize_name
        self.first_name = first_name.downcase.titleize
        self.last_name = last_name.downcase.titleize
    end
end
