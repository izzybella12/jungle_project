class User < ActiveRecord::Base
  before_save :downcase_fields
  
  has_secure_password 
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true

  # def self.authenticate_with_credentials(email, password)
  #   # email_formated = email.strip.downcase!
  #   user = User.find_by(email)

  #   if user && user.authenticate(password)
  #     user 
  #   else 
  #     nil
  #   end
  # end

  # def downcase_fields
  #   self.email.downcase!
  # end

end
