class UsersController < ApplicationController
  before_filter do
    redirect_to :root if Rails.env.production?
  end

  layout "application"


  def index
  end

  def new
    @user = User.new
  end

  def create
    if(params[:user].has_key?(:email))
      params[:user][:email] = params[:user][:email].downcase
      @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id 
          flash[:notice] = "Welcome to MyFlix. You are now registered."
          redirect_to videos_path
        else
          flash[:error] = "There was a problem creating the user"
          redirect_to register_path
        end
    else
      flash[:error] = "There was a problem creating the user"
      redirect_to register_path
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end

end