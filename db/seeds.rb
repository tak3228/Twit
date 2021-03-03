# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users deviseのパスワードが特殊
users = [
  { name: 'Mason', email: 'hirayama@on-sight.ne.jp', password: 'taka3228' },
  { name: 'Adam', email: 'hirayama+1@on-sight.ne.jp', password: 'taka3228' },
  { name: 'Butter', email: 'hirayama+2@on-sight.ne.jp', password: 'taka3228' },
  { name: 'Cherry', email: 'hirayama+3@on-sight.ne.jp', password: 'taka3228' },
]
users.each do |record|
  User.create!(record) unless User.find_by(email: record[:email])
end

# @user = User.new
# @user.name = 'Adam'
# @user.email = 'hirayama+1@on-sight.ne.jp'
# @user.encrypted_password = 'taka3228'
# @user.bio = 'English'
# @user.save
