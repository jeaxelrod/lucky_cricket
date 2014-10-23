require 'rails_helper'

feature "Ordering crickets" do
  before :all do
    Product.create(name: "Cricket Flour", price: 20.00, description: "Meow")
  end
  scenario "User checkouts an order of crickets", js: true do
    visit root_path
    click_on("Checkout")

    expect(page).to have_css "#sold_out_modal"
  end
  scenario "User inputs info to checkout order of crickets", js: true do
    visit root_path
    click_on("Checkout")
    fill_in "First Name", with: "First name"
    fill_in "Last Name", with: "Last name"
    fill_in "Zip Code", with: "12345"
    fill_in "customer[orders_attributes][0][comments]", with: "Comment"
    page.find("input#review").click

    expect(page).to have_content "We apologize, we are currently back-ordered."
    customer = Customer.first
    expect(customer.first_name).to eql("First name")
    expect(customer.last_name).to eql("Last name")
    expect(customer.zip).to eql(12345)
    order = Order.first
    expect(order.comments).to eql("Comment")
    expect(order.quantity).to eql(1)
  end
end
