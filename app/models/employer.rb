class Employer < ActiveRecord::Base
  attr_accessible :company, :email, :password
   has_many :users

  validates :company, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 20 } ,format: { with: VALID_EMAIL_REGEX },uniqueness: true
  validates :password, presence: true, length: { maximum: 20 }

  def password_matches?(password_to_match)
    self.password == password_to_match
  end

end
