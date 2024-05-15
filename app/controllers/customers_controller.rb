class CustomersController < ApplicationController
  def index
    # @customers = Customer.from_wisphub
    @title = "CLIENTES"
    @customers = Entity.all
 
  end
  def show
    # @customer = Customer.load(429)
  end

  def new
    @customer = Entity.new
    render layout: false
  end
  
  def create
    #group_id = Groups.where(name: "Customers").first.id
    #group_id = Groups.CustomersId
    customer = Entity.create(name: params["nombre"])
    @customers = Entity.all
    render "index"
  end

  def destroy
    customer = Entity.find(params["id"])
    customer.destroy
    @customers = Entity.all
    render "index"
  end
 
end
