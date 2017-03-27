class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create, :confirm_email]
#  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params.merge(password: params[:password], password_confirmation: params[:password_confirmation]))
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    user = current_user
    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
#    if @user.update(user_params)
#      render json: @user
#    else
#      render json: @user.errors, status: :unprocessable_entity
#    end
  end

  # DELETE /users/1
  def destroy
    #    @user.destroy
    current_user.destroy
    head 204
  end

  #renders html page here
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      @message = "You account is activated now!"
    else
      @message = "Your account should be activated already, if you can't login, please contact us zuimeng1995@gmail.com"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :active, :admin)
  end
end
