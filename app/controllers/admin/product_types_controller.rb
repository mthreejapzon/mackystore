class Admin::ProductTypesController < Admin::BaseController
  def index
    @product_types = ProductType.all
  end

  def new
    @product_type = ProductType.new
  end

  def edit
    @product_type = ProductType.find(params[:id])
  end

  def create
    @product_types = ProductType.new(product_types_params)
 
    if @product_types.save
      redirect_to admin_product_types_path, notice: "Product size successfully created"
    else
      render "new"
    end
  end

  def update
    @product_types = ProductType.find(params[:id])
   
    if @@product_types.update(product_types_params)
      redirect_to admin_product_type_path, notice: "Product size successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @product_types = ProductType.find(params[:id])
    @product_types.destroy
    redirect_to admin_product_types_path, notice: "Product size successfully deleted"
  end

  private
  def product_types_params
    params.require(:product_type).permit(:name)
  end
end
