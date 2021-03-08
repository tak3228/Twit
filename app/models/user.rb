class User < ApplicationRecord
  # ツイート機能用のアソシエーション
  has_many :tweets
  has_many :commnets
  # フォロー機能用のアソシエーション(関連付け)
  # has_manyは複数形
  # throughは中間テーブルの設定
  # sourceは別のモデルを参照する
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower

  # フォロワー機能用のアソシエーション(関連付け)
  # foreign_key=入口, source=出口
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user

  # いいね機能のアソシエーション
  has_many :likes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  # フォロー機能
  # self には user.follow(other) を実行したとき user が代入されます。
  # つまり、実行した User のインスタンスがself
  def follow(other_user)
    return if self == other_user

    relationships.find_or_create_by!(follower: other_user)
  end

  def following?(user)
    followings.include?(user)
  end

  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end

  # deviseのユーザでパスワードなしで更新する
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
