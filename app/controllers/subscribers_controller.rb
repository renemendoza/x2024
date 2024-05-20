class SubscribersController < ApplicationController
  def index
    @title = "Subscriptores"
    @subscribers = Subscriber.WithCustomerNames

  end

  def new
    @subscriber = Subscriber.new
    @domains = Domain.Names 
    @customers = Entity.Customers
    render layout: false
  end
  
  def create
    subscriber = Subscriber.create(username: params["username"], domain: params["domain"],
                           password: params["password"], customer_id: params["customer_id"]
                          )
    @subscribers = Subscriber.all
    render "index"
  end

  def destroy
    subscriber = Subscriber.find(params["id"])
    subscriber.destroy
    @subscribers = Subscriber.all
    render "index"
  end

end

