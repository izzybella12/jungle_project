class User < ActiveRecord::Base
  
  has_secure_password 
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    modified_email = email.downcase.strip
    user = User.find_by_email(modified_email)

    if user && user.authenticate(password)
      user 
    else 
      nil
    end
  end
end
