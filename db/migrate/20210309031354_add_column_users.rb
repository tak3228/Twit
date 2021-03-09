class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :locate, :string
    add_column :users, :website, :string
    add_column :users, :birthday_at, :datetime
  end
end
