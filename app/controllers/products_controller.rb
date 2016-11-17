class ProductsController < ApplicationController
  def index
    render :index
  end

  def show
    @product = Product.find_or_create_by(name: params[:id])
    semantics = SemanticsService.new(@product)
    @results = semantics.search['results']
    render :show
  end

  def search
    redirect_to action: :show, id: params[:term]
  end
end
