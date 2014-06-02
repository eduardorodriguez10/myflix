class SessionsController < ApplicationController
  before_filter do
    redirect_to :root if Rails.env.production?
  end

  layout "application"


  def index
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:notice] = "You've logged in!"
      redirect_to videos_path
    else
      flash[:error] = "There's something wrong with your username or password"
      redirect_to register_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out!"
    redirect_to root_path
  end

end