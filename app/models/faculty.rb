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

    
    #Callbacks code here...
        
    before_validation :normalize_name, :remove_whitespaces

    after_initialize do |faculty|
        puts "You have initialized an faculty!"
    end

    after_find do |faculty|
        puts "You have found an faculty!"
    end

    after_create do |faculty|
        puts "Faculty #{faculty.first_name} #{faculty.last_name} has been created."
    end

    after_update do |faculty|
        puts "Faculty #{faculty.first_name} #{faculty.last_name} has been updated."
    end

    after_destroy do |faculty|
        puts "Faculty #{faculty.first_name} #{faculty.last_name} has been destroyed."
    end

    after_save do |faculty|
        puts "Email Validated"
    end

    after_validation :check_date_of_birth, if: Proc.new { |faculty| faculty.errors[:date_of_birth] == [] }
    def check_date_of_birth
        puts "Faculty Date of birth is Vaild."
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
