require "test_helper"

class InboundRoutingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inbound_routing_index_url
    assert_response :success
  end
end
