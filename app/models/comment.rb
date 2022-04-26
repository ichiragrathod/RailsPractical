class Comment < ApplicationRecord
  validates :comment_content, :date_of_comment, presence:true
  belongs_to :article
end
