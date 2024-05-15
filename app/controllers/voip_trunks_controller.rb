class VoipTrunksController < ApplicationController
  def index
    @title = "TRONCALES"
    @trunks = VoipTrunk.all
  end

  def new
    @trunk = VoipTrunk.new
    render layout: false
  end
  
  def create
    #group_id = Groups.where(name: "Customers").first.id
    #group_id = Groups.CustomersId
    trunk = VoipTrunk.create(name: params["nombre"], host: params["host"])
    @trunks = VoipTrunk.all
    render "index"
  end

end
