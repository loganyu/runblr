class Follow < ActiveRecord::Base
  attr_accessible(
    :runner_followee_id,
    :runner_follower_id
  )

  belongs_to(
    :followee,
    :class_name => "User",
    :foreign_key => :runner_followee_id,
    :primary_key => :id
  )

  belongs_to(
    :follower,
    :class_name => "User",
    :foreign_key => :runner_follower_id,
    :primary_key => :id
  )

  validates(
    :runner_followee_id,
    :runner_follower_id,
    :presence => true
  )
end
