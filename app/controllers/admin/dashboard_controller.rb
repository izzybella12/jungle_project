class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["AUTH_NAME"], password: ENV["AUTH_PASSWORD"]

  def show
    @products = Product.all.count
    @categories = Category.all.count
  end

end
