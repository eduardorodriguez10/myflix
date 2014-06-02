class RootController < ApplicationController
  before_filter do
    redirect_to :root if Rails.env.production?
  end

  layout "application"

  def index
  end

  def home
  end 

  def sign_in
  end

  def register
  end

end

