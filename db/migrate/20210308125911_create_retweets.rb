class CreateRetweets < ActiveRecord::Migration[6.1]
  def change
    create_table :retweets do |t|
      t.references :user
      t.references :tweet
      t.string :text

      t.timestamps

      # ペアで重複させない
      t.index %i[user_id tweet_id], unique: true
    end
  end
end
