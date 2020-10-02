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
    @product_type = ProductType.new(product_type_params)
 
    if @product_type.save
      redirect_to admin_product_types_path, notice: "Product size successfully created"
    else
      render "new"
    end
  end

  def update
    @product_type = ProductType.find(params[:id])
   
    if @product_type.update(product_type_params)
      redirect_to admin_product_types_path, notice: "Product size successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @product_type = ProductType.find(params[:id])
    @product_type.destroy
    redirect_to admin_product_types_path, notice: "Product size successfully deleted"
  end

  private
  def product_type_params
    params.require(:product_type).permit(:name, :image)
  end
end
