class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash["success"] = t ".success"
      redirect_to @user
    else
      flash["danger"] = t ".error"
      render "new"
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password
  end

  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash["danger"] = t ".error"
      redirect_to root_path
    end
  end
end
