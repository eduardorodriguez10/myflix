class CategoriesController < ApplicationController
  before_filter do
    redirect_to :root if Rails.env.production?
  end

  layout "application"

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @videos = Video.where(category_id: @category.id)
  end 

end