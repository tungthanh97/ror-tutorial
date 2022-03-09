class User < ApplicationRecord
  has_many :articles
  validates :name, presence: true,
                   length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 3, maximum: 25 },
                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
