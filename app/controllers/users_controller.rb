class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]
  before_action { I18n.locale = :ru }

  def index = @users = User.all.count

  def show = @comments = @user.comments

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to current_user, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user = @user = User.find(params[:id])

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
