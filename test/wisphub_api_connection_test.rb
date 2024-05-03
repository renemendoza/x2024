require "test_helper"
require "minitest/autorun"
require 'securerandom'
require 'faraday'

class WisphubApiConnectionTest < ActiveSupport::TestCase

  SUCCESSFULL_RESPONSE = WisphubApiConnection::SUCCESSFULL_RESPONSE
  FORBIDDEN_ERROR_RESPONSE = WisphubApiConnection::FORBIDDEN_ERROR_RESPONSE
  NOT_FOUND_ERROR_RESPONSE = WisphubApiConnection::NOT_FOUND_ERROR_RESPONSE 
  INTERNAL_SERVER_ERROR_RESPONSE = WisphubApiConnection::INTERNAL_SERVER_ERROR_RESPONSE
  UNAUTHORIZED_ERROR_RESPONSE = WisphubApiConnection::UNAUTHORIZED_ERROR_RESPONSE

  def setup
    @base_uri = ENV['WISPHUB_API_URI'] = 'http://api.wisphub.test'
    @api_key = ENV['WISPHUB_API_KEY'] = SecureRandom.hex
    @stubs = Faraday::Adapter::Test::Stubs.new
      #faraday.request :authorization, 'Api-Key', @wisphub_api_key
  end

  test "configuration error" do
    ENV['WISPHUB_API_KEY'] = nil #SecureRandom.hex
    ENV['WISPHUB_API_URI'] = nil #SecureRandom.hex
    assert_raises(WisphubApiConnection::ConfigurationError) do
      WisphubApiConnection.new.get('/customers')
    end
  end

  test "api_url configuration correct" do
    assert_equal @base_uri, WisphubApiConnection.new.wisphub_api_uri
  end

  test "api key properly configured " do
    assert_equal @api_key, WisphubApiConnection.new.wisphub_api_key
  end

  test "headers properly configured " do
    test_conn = Faraday.new { |faraday|
      faraday.headers['Authorization'] = "Api-Key #{@api_key}"
      faraday.adapter :test, @stubs
    }
    wisphub_api = WisphubApiConnection.new(test_conn)
    auth_header = "Api-Key #{@api_key}"
    assert_equal auth_header, wisphub_api.faraday_conn.headers["Authorization"]
  end

  test "unauthorized request should raise stuff" do
    # esta evitando requests al internet?
    #wisphub_api_response = mock_http_request(401, UNAUTHORIZED_ERROR_RESPONSE, false)
    #stubs.get("#{@base_uri}/customers") do |env|

    @stubs.get("/customers") do |env|
      [401, {}, mock_http_request(401, UNAUTHORIZED_ERROR_RESPONSE, false) ]
    end

    wisphub_api = WisphubApiConnection.new( faraday_test_connection(@stubs) )
    assert_raises(WisphubApiConnection::UnauthorizedError) do
      wisphub_api.get('/customers')
    end
    @stubs.verify_stubbed_calls
  end

  test "forbidden request" do
    @stubs.get("/customers") do |env|
      [403, {}, mock_http_request(403, FORBIDDEN_ERROR_RESPONSE, false)]
    end
    wisphub_api = WisphubApiConnection.new( faraday_test_connection(@stubs) )
    assert_raises(WisphubApiConnection::ForbiddenError) do
      wisphub_api.get('/customers')
    end
 #   wisphub_api.verify
    @stubs.verify_stubbed_calls
  end
  test "not found request" do
    @stubs.get("/customers") do |env|
      [404, {}, mock_http_request(404, NOT_FOUND_ERROR_RESPONSE, false)]
    end
    wisphub_api = WisphubApiConnection.new( faraday_test_connection(@stubs) )
    assert_raises(WisphubApiConnection::NotFoundError) do
      wisphub_api.get('/customers')
    end
    @stubs.verify_stubbed_calls

    #response = wisphub_api.get('/customers')
    #assert_equal 404, response.status
    #assert_equal NOT_FOUND_ERROR_RESPONSE, response.body
  end

  test "internal server error request" do
#
#    wisphub_api = Minitest::Mock.new
#    wisphub_api.expect :make_request, mock_http_request(500, INTERNAL_SERVER_ERROR_RESPONSE), ['/customers']
#    response = wisphub_api.make_request('/customers')
#    assert_equal 500, response.status
#    assert_equal INTERNAL_SERVER_ERROR_RESPONSE, response.body
  end

  def after
    Faraday.default_connection = nil
  end

end

  #test no path provided
    #error = ->{ raise WisphubApiConnection::UnauthorizedError} 

 # test "succesfully make_request to /customers" do
 #   wisphub_api = Minitest::Mock.new
 #   wisphub_api.expect :make_request, mock_http_request(200, SUCCESSFULL_RESPONSE), ['/customers']
 #   response = wisphub_api.get('/customers')
 #   assert_equal 200, response.status
 #   assert_equal SUCCESSFULL_RESPONSE, response.body
 # end\
#
#    wisphub_response = Minitest::Mock.new
#    wisphub_response.expect :status, 500
#    wisphub_response.expect :body, INTERNAL_SERVER_ERROR_RESPONSE 

#requested_path = "clientes/429/"
#
#resource_url = "#{ENV['WISPHUB_API_URI']} /clientes/429/"
#WISPHUB_API_URI = 'https://api.wisphub.net/api/clientes/429/'
#I want you to act as a software developer.
#I will provide some specific information about an existing ruby on rails 
#
# web app requirements, and it will be your job to come up with an architecture
# and code for developing secure app with Ruby on Rails and HTMX. 
# My first request is 'I want a system that will query the `wisphub` api 
# at uri: `http://localhost/clientes/429` periodically in minutes and 
# create a active record cache of sorts that is shown to the users 
# as tables that refresh using htmx periodically in seconds. 
# here is an example of the API call using `curl` you need to make 
# to create and update your cache `curl --location --request 
# GET 'https://api.wisphub.net/api/clientes/429/'  
# --header 'Authorization: Api-Key  MYKEY1234567890'` 

