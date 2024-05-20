class VoipTrunksController < ApplicationController
  def index
    @title = "TRONCALES IP"
    @trunks = VoipTrunk.all

  end

  def new
    @trunk = VoipTrunk.new
    @customers = Entity.Customers
    render layout: false
  end
  
  def create
    trunk = VoipTrunk.create(name: params["nombre"], host: params["host"], entity_id: params["customer_id"])
    @trunks = VoipTrunk.all
    render "index"
  end

  def destroy
    trunk = VoipTrunk.find(params["id"])
    trunk.destroy
    @trunks = VoipTrunk.all
    render "index"
  end

end
