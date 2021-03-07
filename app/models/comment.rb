class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates :text, length: { maximum: 140 }, presence: true
end
