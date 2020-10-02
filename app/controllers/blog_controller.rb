class BlogController < ApplicationController
  def index
    @featured_blog = Blog.order(created_at: :desc).first
    @other_blogs = Blog.order(created_at: :desc).offset(1)
  end

  def show
    @blog = Blog.find_by(slug: params[:slug])
  end
end
