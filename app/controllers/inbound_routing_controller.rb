class InboundRoutingController < ApplicationController
  def index
    @inbound_routings = InboundRouting.all
  end
end
