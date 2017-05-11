class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  #return user which is active and password matches
  def user
    user = User.find_by_email(email)
    #account is not activated
    if user && user.authenticate(password) && user.active == false
      errors.add :user_authentication, 'account is not activated'
      nil
    elsif user && user.authenticate(password) && user.active
      return user
    else
      errors.add :user_authentication, 'invalid credentials'
      nil
    end
  end
end
