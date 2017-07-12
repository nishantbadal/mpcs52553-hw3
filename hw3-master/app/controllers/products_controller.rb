class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params["id"])
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.price = params[:price]
    @product.title = params[:title]
    @product.description = params[:description]
    @product.save
    redirect_to action: :show
  end
    
  def new
  end

  def create
    p = Product.new
    p.title = params["title"]
    p.price = params["price"].to_f * 100
    p.description = params["description"]
    p.save

    redirect_to "/products"
  end

  def edit
    @product = Product.find_by(id: params["id"])
  end
    
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.delete
    redirect_to "/products"
  end

end
