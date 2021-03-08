class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :tweet

      t.timestamps

      # ペアで重複させない
      t.index %i[user_id tweet_id], unique: true
    end
  end
end
