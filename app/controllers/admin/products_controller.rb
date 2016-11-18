class Admin::ProductsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'admin'

  def index
    @products = Product.all
    render :index
  end

  def new
    render :new
  end

  def show
    @product = Product.find_by_id(params[:id])
    render :show
  end

  def fetch_cache
    product = Product.find_by_id(params[:id])
    SemanticsService.new(product).fetch_and_cache
    redirect_to admin_product_path(product)
  end

  def destroy
    product = Product.find_by_id(params[:id])
    product.destroy
    redirect_to admin_products_path
  end

  def create
    product = Product.find_or_create_by(name: params[:name])
    SemanticsService.new(product).fetch_and_cache
    redirect_to admin_products_path
  end
end
