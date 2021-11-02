class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :plot
  validates :comment_text, presence: true
end
