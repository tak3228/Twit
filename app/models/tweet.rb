class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments

  # いいね機能のアソシエーション
  has_many :likes, dependent: :destroy

  # RT機能のアソシエーション
  has_many :retweets, dependent: :destroy

  # テキストか画像のどちらかは必須
  validates :text, presence: true, unless: :image?, length: { maximum: 140 }
  validates :image, presence: true, unless: :text?

  # CarrierWave
  mount_uploader :image, ImageUploader
end
