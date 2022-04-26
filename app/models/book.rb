class Book < ApplicationRecord
    belongs_to :author
    has_many :images, as: :imageable
    validates :name, presence: true, length:{minimum:2, maximum:300}
    validates :price, presence: true
    validates :author_id, presence: true
end
