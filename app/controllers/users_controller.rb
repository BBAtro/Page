class UsersController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update]
  before_action :set_user!, only: %i[edit update]

  def index
    @posts = current_user.posts.order(created_at: :desc).decorate
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to users_path
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :login, :password, :password_confirmation, :old_password, :description)
  end
end