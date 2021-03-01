# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.new
@user.name = 'mason'
@user.mail = 'hirayama@gmail.com'
@user.location = 'Fukuoka, Japan'
@user.about = 'Hello, I am mason. I am from database!'
@user.save

@user = User.new
@user.name = 'test'
@user.mail = 'hirayama2@gmail.com'
@user.location = 'Tottori, Japan'
@user.about = 'Nice to meet you. I am from database!'
@user.save
