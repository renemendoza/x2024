require 'faraday'
require 'dotenv'
Dotenv.load(Rails.root.join('.env'))

class WisphubApiConnection
  class ConfigurationError < StandardError; end
  class UnauthorizedError < StandardError; end
  class ForbiddenError < StandardError; end
  class NotFoundError < StandardError; end
  class InternalServerError < StandardError; end

  def self.make_request(requested_path)
    unless ENV['WISPHUB_API_URI'] && ENV['WISPHUB_API_KEY']
      raise ConfigurationError, "WISPHUB_API_URI or WISPHUB_API_KEY is not configured"
    end

    resource_url = "#{ENV['WISPHUB_API_URI']}/#{requested_path}"
    
    conn = Faraday.new(url: resource_url) do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
    
    response = conn.get do |req|
      req.headers['Authorization'] = "Api-Key #{ENV['WISPHUB_API_KEY']}"
    end
    
    if response.success?
      data = JSON.parse(response.body)
      return data
      # Process the data as needed (e.g., update ActiveRecord cache)
    else
      case response.status
      when 401
        raise UnauthorizedError, "Unauthorized: The request requires user authentication."
      when 403
        raise ForbiddenError, "Forbidden: The server understood the request, but refuses to authorize it."
      when 404
        raise NotFoundError, "Not Found: The server has not found anything matching the request URI."
      when 500
        raise InternalServerError, "Internal Server Error: The server encountered an unexpected condition."
      else
        puts "API request failed with status: #{response.status}"
      end
    end
  end
end

