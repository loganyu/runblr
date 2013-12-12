# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {username: "loganyu", password: "password"},
  {username: "mebkeflezighi", password: "password"},
  {username: "ryanhall", password: "password"},
  {username: "marycane", password: "password"},
  {username: "nicksimmons", password: "password"}
])

follows = Follow.create([
  {runner_followee_id: 1, runner_follower_id: 2},
  {runner_followee_id: 1, runner_follower_id: 3},
  {runner_followee_id: 4, runner_follower_id: 1},
  {runner_followee_id: 5, runner_follower_id: 1}
])