# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
pass="vtr512"
User.delete_all
User.create(username:"root", name:"root", email: "user1@domain.net", password: pass, password_confirmation: pass);
User.create(username:"user2", name:"user1", email: "user2@domain.net", password: pass, password_confirmation: pass);
User.create(username:"user3", name:"user2", email: "user3@domain.net", password: pass, password_confirmation: pass);
User.create(username:"user4", name:"user3", email: "user4@domain.net", password: pass, password_confirmation: pass);
