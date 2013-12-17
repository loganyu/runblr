class User < ActiveRecord::Base
  attr_accessible :username, :password, :session_token, :email, :profile_picture
  after_initialize :ensure_session_token

  validates :username, :session_token, :password_digest, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :username, :length => 6..20
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  has_attached_file :profile_picture, :styles => {
          :big => "600x600>",
          :small => "75x75#"
        }

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
  has_many :comments, inverse_of: :user
  has_many :user_comment_likes, inverse_of: :user


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
    return false if @user_post_like.nil?
    @user_post_like.value == 1 ? true : false
  end

  def likes_comment?(comment)
    @user_comment_like = UserCommentLike.find_by_comment_id_and_user_id(comment.id, self.id)
    return false if @user_comment_like.nil?
    @user_comment_like.value == 1 ? true : false
  end

  def get_user_posts_feed
    all_posts = []
    all_posts.concat(self.posts)
    self.followed_users.each do |followed_user|
      all_posts = all_posts.concat(followed_user.posts)
    end
    return all_posts.sort_by {|x| x.created_at }
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver!
  end

  def send_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64(16)
    self.save!
    UserMailer.password_reset(self).deliver!
  end

  private

     def ensure_session_token
       self.session_token ||= SecureRandom.urlsafe_base64
     end

end
