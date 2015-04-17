class UsersController < ApplicationController

  layout 'internal'
  before_action :authenticate, except: [:create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if current_user != @user
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render:edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render:new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.comments.each do |comment|
      comment.user_id = nil
      comment.save
    end
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end




end
