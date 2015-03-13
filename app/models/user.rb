class User < ActiveRecord::Base
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.find_by_credentials(username, password)
    return unless user = User.find_by_username(username)
    user if user.is_password?(password)
  end

  def get_new_session_token
    token = nil
    until token && User.find_by_session_token(token).nil?
      token = SecureRandom::urlsafe_base64(16)
    end
    self.session_token = token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
