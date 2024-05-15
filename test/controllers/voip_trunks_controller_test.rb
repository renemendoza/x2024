require "test_helper"

class VoipTrunksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get voip_trunks_index_url
    assert_response :success
  end
end
