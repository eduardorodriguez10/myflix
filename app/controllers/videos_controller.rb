class VideosController < ApplicationController
  before_filter do
    redirect_to :root if Rails.env.production?
  end

  layout "application"

  def search
    @videos = Video.search_by_title(params[:searchtext])
  end

  def index

  end

  def show
    @video = Video.find(params[:id])
  end

end