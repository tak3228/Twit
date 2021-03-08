class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments

  # いいね機能のアソシエーション
  has_many :likes

  validates :text, length: { maximum: 140 }, presence: true
end
