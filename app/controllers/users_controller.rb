class UsersController < ApplicationController
  before_action :find_user, except: [ :index, :new, :create ]
  before_action :logged_in_user, only: [ :index, :edit, :update, :destroy ]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash["success"] = t ".success"
      redirect_back_or user
    else
      flash["danger"] = t ".error"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".flash.success"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t ".flash.success"
    redirect_to users_url
  end


  private

  def user_params
    params.require(:user).permit :name, :email, :password
  end

  def find_user
    @user ||= User.find_by id: params[:id]
    unless @user
      flash["danger"] = t ".error"
      redirect_to root_path
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "users.flash.logged_in_user.danger"
      redirect_to login_url
    end
  end

  def correct_user
    find_user
    redirect_to root_path unless @user == current_user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
