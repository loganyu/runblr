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
  {post_type: "run", title: "Post Title", user_id: 1,
    body: "Post body", workout_type: "Tempo",
    miles: 6, hours: 2, minutes: 23, seconds: 15},
  {post_type: "run", title: "Post Title", user_id: 1},
  {post_type: "run", title: "Post Title", user_id: 2},
  {post_type: "run", title: "Post Title", user_id: 2},
  {post_type: "run", title: "Post Title", user_id: 3},
  {post_type: "run", title: "Post Title", user_id: 3},
  {post_type: "run", title: "Post Title", user_id: 4},
  {post_type: "run", title: "Post Title", user_id: 4},
  {post_type: "run", title: "Post Title", user_id: 5},
  {post_type: "run", title: "Post Title", user_id: 5},
  {post_type: "run", title: "Post Title", user_id: 6},
  {post_type: "run", title: "Post Title", user_id: 6}
])

comments = Comment.create([
  {body: "Comment body", post_id: 1, user_id: 2},
  {body: "Comment body", post_id: 2, user_id: 3},
  {body: "Comment body", post_id: 3, user_id: 4},
  {body: "Comment body", post_id: 4, user_id: 5},
  {body: "Comment body", post_id: 5, user_id: 6},
  {body: "Comment body", post_id: 6, user_id: 7},
  {body: "Comment body", post_id: 7, user_id: 8},
  {body: "Comment body", post_id: 8, user_id: 9},
  {body: "Comment body", post_id: 9, user_id: 10},
  {body: "Comment body", post_id: 10, user_id: 1},
  {body: "Comment body", post_id: 1, user_id: 4, parent_comment_id: 1},
  {body: "Comment body", post_id: 1, user_id: 5, parent_comment_id: 2}
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