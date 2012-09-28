class User < ActiveRecord::Base
  attr_accessible :email, :experience, :name, :skills, :password, :employer_id
   belongs_to :employer

  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 20 } ,format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { maximum: 20 }

  def password_matches?(password_to_match)
    self.password == password_to_match
  end

  private
  def create_remember_token
    self.remember_token #= SecureRandom.urlsafe_base64
  end


end
