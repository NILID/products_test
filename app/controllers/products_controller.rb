class ProductsController < ApplicationController
  load_and_authorize_resource

  def index; end
  def show;  end
  def new;   end

  def create
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end


  private
    def product_params
      params.require(:product).permit(:title, :domain, :device, :os, user_ids: [],
                                      service_blocks_attributes: [:id, :title, :content, :img, :position, :mark, :_destroy],
                                      help_blocks_attributes: [:id, :title, :content, :img, :position, :mark, :_destroy])
    end
end
