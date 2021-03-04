class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :tweet
      t.string :text

      t.timestamps null: false
    end
  end
end
