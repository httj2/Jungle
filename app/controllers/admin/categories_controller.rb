class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["SECRET_USER"], password: ENV["SECRET_PASSWORD"]

  def index
    @category = Category.all
    @products = Product.all
  end


  def new
    @category = Category.new
  end

  def create 
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end


  private
    def category_params
      params.require(:category).permit(
        :name
      )
    end 





end 