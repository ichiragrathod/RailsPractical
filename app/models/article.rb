class Article < ApplicationRecord
  validates :title, :body, :release_date, presence:true
end
