class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :user
      # 別名で引っ張りたい場合は外部キーと明示する必要あり
      t.references :follower, foreign_key: { to_table: :users }

      t.timestamps

      # ペアで重複させない
      t.index %i[user_id follower_id], unique: true
    end
  end
end
