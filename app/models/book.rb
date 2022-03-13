class Book < ApplicationRecord
    belongs_to :author

    validates :name, presence: true, length:{minimum:2, maximum:300}
    validates :price, presence: true
end
