class User < ActiveRecord::Base
  attr_accessible :username, :password, :session_token
  after_initialize :ensure_session_token

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

  validates :username, :session_token, :password_digest, presence: true

  def password=(pw_string)
    self.password_digest = BCrypt::Password.create(pw_string)
  end

  def reset_session_token!
    self.update_attributes(session_token: SecureRandom.urlsafe_base64)
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  private

     def ensure_session_token
       self.session_token ||= SecureRandom.urlsafe_base64
     end

end
