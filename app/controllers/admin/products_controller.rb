class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all.order(:name)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
 
    if @product.save
      redirect_to admin_products_path, notice: "Product successfully created"
    else
      render "new"
    end
  end

  def update
    @product = Product.find(params[:id])
   
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, notice: "Product successfully deleted"
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :image, :type, product_size_ids: [])
  end
end
