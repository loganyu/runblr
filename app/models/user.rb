class User < ActiveRecord::Base
  attr_accessible :username, :password, :session_token
  after_initialize :ensure_session_token

  validates :username, :session_token, :password_digest, presence: true

  has_many(
    :inbound_follows,
    :class_name => "Follow",
    :foreign_key => :runner_followee_id,
    :primary_key => :id
  )

  has_many(
    :followers,
    :class_name => "User",
    :through => :inbound_follows,
    :source => :follower
  )

  has_many(
    :outbound_follows,
    :class_name => "Follow",
    :foreign_key => :runner_follower_id,
    :primary_key => :id
  )

  has_many(
    :followed_users,
    :class_name => "User",
    :through => :outbound_follows,
    :source => :followee
  )

  has_many :posts, inverse_of: :user
  has_many :user_post_likes, inverse_of: :user


  def password=(pw_string)
    self.password_digest = BCrypt::Password.create(pw_string)
  end

  def reset_session_token!
    self.update_attributes(session_token: SecureRandom.urlsafe_base64)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end
  
  def likes_post?(post)
    @user_post_like = UserPostLike.find_by_post_id_and_user_id(post.id, self.id)

    @user_post_like.value == 1 ? true : false
  end

  private

     def ensure_session_token
       self.session_token ||= SecureRandom.urlsafe_base64
     end

end
