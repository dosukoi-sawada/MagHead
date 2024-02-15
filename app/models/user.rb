require 'securerandom'

class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validate :valid_email?
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    private

    def valid_email?
        errors.add(:email, 'is invalid') unless self.email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    end
end
