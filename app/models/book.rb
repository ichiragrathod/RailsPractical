class Book < ApplicationRecord
    belongs_to :Author
    has_many :images, as: :imageable

    validates :name, presence: true, length:{minimum:2, maximum:300}
    validates :price, presence: true
end
