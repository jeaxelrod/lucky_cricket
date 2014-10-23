class CustomersController < ApplicationController
  def create
    @customer = Customer.new(customer_params)
    if @customer.save 
      #render page
    else
      #Handle error
    end
  end
  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
  end
  def new
    @product = Product.find(params[:product_id])
    @quantity = params[:quantity]
    @customer = Customer.new
    @order =@customer.orders.build
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :zip, :email, orders_attributes: [:comments, :quantity, :product_id])
  end
end
