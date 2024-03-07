require "test_helper"
require 'securerandom'
#require 'lib/wisphub_api_connection'

# include WispHubAPIConnection
class WispHubAPIConnectionTest < ActiveSupport::TestCase
  test_always_is_ok do
    r = 'OK'
    assert_equal "OK", r
  end
#    # Simulate a successful request test case here
#  test "succesfully make_request with path/1" do
#    ENV['WISPHUB_API_KEY'] = SecureRandom.hex
#    ENV['WISPHUB_API_URI'] = SecureRandom.hex
#
##    allow(Dotenv).to receive(:load).with(Rails.root.join('.env')).and_return(true)
#    allow(Faraday::Connection).to receive(:get).and_return(double(success?: true, body: "OK", status: 200))
#
#    response = WispHubAPIConnection.make_request('path/1')
#  
#    assert_equal "OK", response
#  end

#  test "unauthorized request" do
#    # Simulate an unauthorized request test case here
#  end
#
#  test "forbidden request" do
#    # Simulate a forbidden request test case here
#  end
#
#  test "not found request" do
#    # Simulate a not found request test case here
#  end
#
#  test "internal server error request" do
#    # Simulate an internal server error request test case here
#  end

   #test "configuration error" do
  #   assert true

  # end
#create an active support testcase for the module, include tests that simulate http codes 401, 403, 404 and 500
end



#require Rails.root.join 'lib/wisphub_api_connection'
#include WispHubAPIConnection

#requested_path = "clientes/429/"
#
#response_data = WispHubAPIConnection::make_request(requested_path)
#
#puts response_data

#module WispHubAPIConnection
#  def self.make_request(requested_path)
#end
#resource_url = "#{ENV['WISPHUB_API_URI']}/#{requested_path}"
## Define the API endpoint and API key
## Create a Faraday connection
#conn = Faraday.new(url: clients_url) do |faraday|
#  faraday.request :url_encoded
#  faraday.adapter Faraday.default_adapter
#end
## Make a GET request to the API with the Authorization header
#response = conn.get do |req|
#  req.headers['Authorization'] = "Api-Key #{ENV['WISPHUB_API_KEY']}"
#  #puts req.inspect
#end
## Check the response status and body
#if response.success?
#  data = JSON.parse(response.body)
#  puts data
#  # Process the data as needed (e.g., update ActiveRecord cache)
#else
#  puts "API request failed with status: #{response.status}"
#end




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

