class Admin::ProductQuantitiesController < Admin::BaseController
  def index
    @product_quantities = ProductProductSize.all
  end

  def edit
    @product_quantity = ProductProductSize.find(params[:id])
  end

  def update
    @product_quantity = ProductProductSize.find(params[:id])
   
    if @product_quantity.update(product_product_size_params)
      redirect_to admin_product_quantities_path, notice: "Product successfully updated"
    else
      render 'edit'
    end
  end

  private
  def product_product_size_params
    params.require(:product_product_size).permit(:quantity)
  end
end
