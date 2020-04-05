class UsersController < ApplicationController
  
  def index
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def current_user
    if session[:user_id]
      if @current_user.nil?
        @current_user = User.find(id: session[:user_id])
      else
        @current_user
      end
    end
  end  
  
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
