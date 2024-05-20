class DomainsController < ApplicationController
  def index
    @title = "Dominios"
    @new_uri = "/domains/new"
    @new_label = "Agregar Dominio"
    @css_class = "domains"
    @domains = Domain.all

  end

  def new
    @domain = Domain.new
    @customers = Entity.Customers
    render layout: false
  end
  
  def create
    domain = Domain.create(name: params["nombre"],
                           customer_id: params["customer_id"]
                          )
    @domains = Domain.all
    render "index"
  end

  def destroy
    domain = Domain.find(params["id"])
    domain.destroy
    head :ok
  end

end
