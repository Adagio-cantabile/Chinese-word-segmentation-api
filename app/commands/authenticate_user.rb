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
    return user if user && user.authenticate(password) && user.active

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
