class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
  end

  def product_count
    @products = Product.all
    @products.count
  end

  def category_count
    @categories = Category.all
    @categories.count
  end

end
