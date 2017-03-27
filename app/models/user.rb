class User < ApplicationRecord
  has_secure_password

  before_create :confirmation_token
  before_save { self.email = email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validate :valid_password_create, on: :create
#  validates :password, presence: true, length: { minimum: 6}

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  def valid_password_create
    if password.blank?
      errors.add(:password, "can't be blank")
    else
      errors.add(:password, 'is too short') if password.length < 6
    end
  end
  
  def email_activate
    self.active = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
  #set comfirmation token before creating user
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  
end
