class Author < ApplicationRecord
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true,uniqueness:{case_sensitive:false}, 
    length: {minimum:3, maximum:105},
    format:{ with:VALID_EMAIL_REGEX }

    validates :first_name, presence: true, length:{minimum:2, maximum:100}
    validates :last_name, presence: true, length:{minimum:2, maximum:100}
    validates :date_of_birth, presence: true, length:{minimum:2, maximum:100}
end
