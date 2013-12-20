# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {username: "loganyu", password: "password", email: "yu.logan@gmail.com", has_profile_picture: "false"},
  {username: "mebkeflezighi", password: "password", email: "meb@email.com", has_profile_picture: "false"},
  {username: "ryanhall", password: "password", email: "ryan@email.com", has_profile_picture: "false"},
  {username: "marycane", password: "password", email: "mary@email.com", has_profile_picture: "false"},
  {username: "nicksimmons", password: "password", email: "nick@email.com", has_profile_picture: "false"}
])

follows = Follow.create([
  {runner_followee_id: 1, runner_follower_id: 2},
  {runner_followee_id: 1, runner_follower_id: 3},
  {runner_followee_id: 4, runner_follower_id: 1},
  {runner_followee_id: 5, runner_follower_id: 1}
])

posts = Post.create([
  {post_type: "run", title: "Run to school.", user_id: 1,
    body: "It was really cold!", workout_type: "Tempo",
    miles: 6, hours: 2, minutes: 23, seconds: 15},
    {post_type: "run", title: "This is so cool!", user_id: 1},
    {post_type: "run", title: "Foot Locker Race", body: "Covered a lot of grounds today on my run....parts of Horse Train, League, C.I.F.S.D. Foot Locker, Aztec XC, &SD Rock n Roll courses.", user_id: 2},
    {post_type: "run", title: "Nationals", body: "Good luck to all runners of all divisions at nationals today!", user_id: 2},
    {post_type: "run", title: "Good luck!", body: "Good luck to all runners of all divisions at nationals today!", user_id: 3},
    {post_type: "run", title: "Congratulations!", body: "Congratulations to Everyone that competed at FLNationals, especially the New Yorkers!", user_id: 3},
    {post_type: "run", title: "Jesus!", body: 'Had a little girl walk by me today and tell her mom, "he (referring to me) looks like Jesus." Greatest compliment ever!', user_id: 3},
    {post_type: "run", title: "Thanks", body: "20 yrs ago, I was nervous about the biggest race in H.S. Today, Sara helped passing out daddy's books", user_id: 4},
    {post_type: "run", title: "Cold", body: "If you aren't outside today you're messing up", user_id: 5},
    {post_type: "run", title: "Thug life", body: "assistant coach thug life", user_id: 5}
])

comments = Comment.create([
  {body: "Yay!", post_id: 1, user_id: 2},
  {body: "Horray!", post_id: 2, user_id: 3},
  {body: "Cool!", post_id: 3, user_id: 4},
  {body: "Cats!", post_id: 4, user_id: 5},
  {body: "Nice going.", post_id: 5, user_id: 1},
  {body: "Right!", post_id: 1, user_id: 4, parent_comment_id: 1},
  {body: "Cats cats!", post_id: 1, user_id: 5, parent_comment_id: 2}
])

post_likes = UserPostLike.create([
  {user_id: 2, post_id: 1, value: 1},
  {user_id: 3, post_id: 1, value: 1},
  {user_id: 4, post_id: 1, value: 1},
  {user_id: 5, post_id: 2, value: 1},
  {user_id: 1, post_id: 2, value: 1},
  {user_id: 3, post_id: 4, value: 1},
  {user_id: 4, post_id: 4, value: 1},
  {user_id: 1, post_id: 3, value: 1},
  {user_id: 3, post_id: 5, value: 1}
])

comment_likes = UserCommentLike.create([
  {user_id: 2, comment_id: 1, value: 1},
  {user_id: 3, comment_id: 1, value: 1},
  {user_id: 4, comment_id: 2, value: 1},
  {user_id: 5, comment_id: 2, value: 1},
  {user_id: 1, comment_id: 2, value: 1},
  {user_id: 3, comment_id: 3, value: 1},
  {user_id: 4, comment_id: 3, value: 1},
  {user_id: 1, comment_id: 4, value: 1},
  {user_id: 3, comment_id: 5, value: 1}
])