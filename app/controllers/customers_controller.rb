class CustomersController < ApplicationController
  def index
    @customers = Customer.from_wisphub
  end
  def show
    @customer = Customer.load(429)
  end
end
