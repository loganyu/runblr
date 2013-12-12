class UserCommentLike < ActiveRecord::Base
  attr_accessible :value, :user_id

  belongs_to :user, inverse_of: :user_comment_likes
  belongs_to :comment, inverse_of: :user_comment_likes
end
