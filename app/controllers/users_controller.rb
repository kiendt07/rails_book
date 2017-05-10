class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
    :following, :followers]
  before_action :admin_user, only: :destroy
  before_action :find_user, except: [ :index, :new, :create ]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".flash.info"
      redirect_to root_url
    else
      flash["danger"] = t ".error"
      render "new"
    end
  end

  def show
    @microposts = @user.microposts.newest_first.paginate page: params[:page]
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

  def following
    @title = t ".title"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render "show_follow"
  end

  def followers
    @title = t ".title"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render "show_follow"
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

  def correct_user
    find_user
    redirect_to root_path unless @user == current_user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
