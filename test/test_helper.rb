ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def mock_http_request(status_code, body_content, is_successfull=true)
      wisphub_response = Minitest::Mock.new
      wisphub_response.expect :status, status_code
      wisphub_response.expect :body, body_content 
      wisphub_response.expect :success, is_successfull
      return wisphub_response
    end

    def faraday_test_connection(stubs)
      Faraday.new { |faraday|
        faraday.adapter :test, stubs
      }
    end

    # Add more helper methods to be used by all tests here...
  end
end
