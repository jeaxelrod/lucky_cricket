class CustomersController < ApplicationController
  def create
  end
  def new
    @product = Product.find(params[:product_id])
    @quantity = params[:quantity]
    @customer = Customer.new
    @order =@customer.orders.build
  end
end
