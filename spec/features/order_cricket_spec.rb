require 'rails_helper'

feature "Ordering crickets" do
  before :all do
    Product.create(name: "Cricket Flour", price: 20.00, description: "Meow")
  end
  scenario "User checkouts an order of crickets", js: true do
    visit root_path
    click_on "Checkout"

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
    expect(order.product_id).to eql(1)
    expect(order.customer_id).to eql(1)
  end
  scenario "User inputs email after completing order", js: true do
    visit root_path
    click_on("Checkout")
    fill_in "First Name", with: "Second name"
    fill_in "Last Name", with: "Last name"
    fill_in "Zip Code", with: "12345"
    fill_in "customer[orders_attributes][0][comments]", with: "Comment"
    page.find("input#review").click
    fill_in "customer[email]", with: "w@m.com"
    click_on "Subscribe"

    expect(page).to_not have_content "We apologize, we are currently back-ordered."
    customer = Customer.last
    expect(customer.first_name).to eql "Second name"
    expect(customer.email).to eql "w@m.com"
  end
end
