class User < ActiveRecord::Base

  has_secure_password
  strip_attributes :only => [:email]
  has_many :reviews

  validates :name, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip.downcase)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
