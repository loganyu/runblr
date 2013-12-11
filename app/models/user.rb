class User < ActiveRecord::Base
  attr_accessible :username, :password, :session_token
  after_initialize :ensure_session_token

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
