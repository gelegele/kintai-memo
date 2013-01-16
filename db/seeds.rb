# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(email: 'admin@h.com', password: 'admin', password_confirmation: 'admin', admin: true)
admin.save

guest = User.new(email: 'guest', password: 'guest', password_confirmation: 'guest', admin: false)
guest.save
