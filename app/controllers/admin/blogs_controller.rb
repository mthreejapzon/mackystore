class Admin::BlogsController < Admin::BaseController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
 
    if @blog.save
      redirect_to admin_blogs_path, notice: "Blog successfully created"
    else
      render "new"
    end
  end

  def update
    @blog = Blog.find(params[:id])
   
    if @blog.update(blog_params)
      redirect_to admin_blogs_path, notice: "Blog successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admin_blogs_path, notice: "Blog successfully deleted"
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text, :author, :slug, :image)
  end

end
