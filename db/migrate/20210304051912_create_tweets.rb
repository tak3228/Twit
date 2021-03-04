class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.references :user
      t.string :text

      t.timestamps null: false
    end
  end
end
