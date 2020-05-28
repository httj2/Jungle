class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["SECRET_USER"], password: ENV["SECRET_PASSWORD"]
  
  def show
    category_count
    product_count
  end
  def category_count 
    @category = Category.count
  end 
  def product_count
    @product = Product.count
  end 
end
