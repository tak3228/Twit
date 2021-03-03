class Relationship < ApplicationRecord
  # フォロー、フォロワー機能用のアソシエーション(関連付け)
  belongs_to :user # belongs_toは単数形
  # class_nameはUserクラスの意味であることの明示
  belongs_to :follower, class_name: 'User'

  # 空でないこと
  validates :user_id, presence: true
  validates :follower_id, presence: true
end
