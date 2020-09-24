class Admin::ProductSizesController < Admin::BaseController
  def index
    @products_sizes = ProductSize.all
  end

  def show
    @product_size = ProductSize.find(params[:id])
  end

  def new
    @product_size = ProductSize.new
  end

  def edit
    @product_size = ProductSize.find(params[:id])
  end

  def create
    @product_size = ProductSize.new(product_sizes_params)
 
    if @product_size.save
      redirect_to admin_product_sizes_path, notice: "Product size successfully created"
    else
      render "new"
    end
  end

  def update
    @product_size = ProductSize.find(params[:id])
   
    if @product_size.update(product_sizes_params)
      redirect_to admin_product_size_path, notice: "Product size successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @product_size = ProductSize.find(params[:id])
    @product_size.destroy
    redirect_to admin_product_sizes_path, notice: "Product size successfully deleted"
  end

  private
  def product_sizes_params
    params.require(:product_size).permit(:name)
  end
end
