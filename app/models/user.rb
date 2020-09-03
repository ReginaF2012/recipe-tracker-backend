class User < ApplicationRecord
    validates :username, presence: :true, uniqueness: :true, length: { in: 3..20 }
    validates :email, presence: :true, uniqueness: :true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password_confirmation, presence: true, on: :create
    validate :password_complexity
    has_many :recipes
    has_many :ingredients, through: :recipes
    has_secure_password
  
    def password_complexity
      # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
      return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
  
      errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    end

end
