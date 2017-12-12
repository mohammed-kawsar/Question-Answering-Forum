class User < ActiveRecord::Base
  has_many :questions,  dependent: :destroy
  #has_many :comments
  
  before_save { self.email = email.downcase }
  validates :name, presence:true, length: {maximum: 50}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: {maximum: 255}, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
end