# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string
#  session_token   :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password
    validates :username, presence:true
    validates :password_digest, presence: {message: "Password can't be blank" }
    validates :password, length: {minimum:6, allow_nil: true}
    before_validation :ensure_session_token

    def self.find_by_credentials(user_name, password)
        user = User.find_by(username:user_name)
        user.nil? ? nil : BCrypt::Password.new(user.password_digest).is_password?(password) ? user : nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def ensure_session_token
        @session_token ||= self.class.generate_session_token
    end

    def password=(new_password)
        @password = new_password
        self.password_digest = BCrypt::Password.create(new_password)
        self.save!
    end
end
