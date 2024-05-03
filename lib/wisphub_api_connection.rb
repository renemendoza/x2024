require 'faraday'
require 'faraday/follow_redirects'
require 'dotenv'
Dotenv.load(Rails.root.join('.env'))

class WisphubApiConnection
  #RESPONSE CONSTANTS
  SUCCESSFULL_RESPONSE = "OK"
  FORBIDDEN_ERROR_RESPONSE = "The server understood the request, but refuses to authorize it."
  NOT_FOUND_ERROR_RESPONSE = "Not Found: The server has not found anything matching the request URI."
  INTERNAL_SERVER_ERROR_RESPONSE = "Internal Server Error: The server encountered an unexpected condition."
  UNAUTHORIZED_ERROR_RESPONSE = "Unauthorized: The request requires user authentication."

  #REQUEST CONSTANTS
  INITIAL_OFFSET=0
  INITIAL_LIMIT_COUNT=5

  #CUSTOM ERRORS meta_prog
  class ConfigurationError < StandardError; end
  class UnauthorizedError < StandardError; end
  class UnprocessableEntityError < StandardError; end
  class ForbiddenError < StandardError; end
  class NotFoundError < StandardError; end
  class InternalServerError < StandardError; end

  attr_reader :wisphub_api_uri, :wisphub_api_key, :faraday_conn

    # dependency injection
  def initialize(faraday_conn=nil)
    configure_request_credentials
    @faraday_conn = faraday_conn || Faraday.new do |faraday|
      faraday.request :url_encoded
      faraday.request :authorization, 'Api-Key', @wisphub_api_key
      faraday.options.timeout = 5
      faraday.adapter Faraday.default_adapter
      faraday.response :follow_redirects
      faraday.response :raise_error
      faraday.response :logger
      #To sums things up, just be sure to configure any "request modifier" middleware
    # before any adapter that actually performs the request.
    end
  end

  def configure_request_credentials
    unless ENV['WISPHUB_API_URI'] && ENV['WISPHUB_API_KEY']
      raise ConfigurationError, "WISPHUB_API_URI or WISPHUB_API_KEY is not configured"
    end
    @wisphub_api_uri = ENV['WISPHUB_API_URI']
    @wisphub_api_key = ENV['WISPHUB_API_KEY']
  end

  class ApiResponseParser
    MULTI_PAGE_RESPONSE_KEYS = ["count", "results", "next"]
    #attr_reader :result,  :success?,  :status
    attr_reader :result,  :status

    def initialize(api_raw_response)
      @result = nil
      if api_raw_response.success?  #test that we hit the response body
          parsed_json = JSON.parse(api_raw_response.body)
          if parsed_json.has_key?('results')
            @result = parsed_json.delete('results')
            #@result = JSON.parse(api_raw_response.body)
          end
        instance_variable_set(:success?, api_raw_response.success?) 
        instance_variable_set(:status, api_raw_response.status) 
        if multi_page?
          MULTI_PAGE_RESPONSE_KEYS.each do |key|
            if key == "next"
              instance_variable_set(:next_page, @result[key]) 
            else
              instance_variable_set("@#{key}".to_sym, @result[key]) 
            end
          end
        else
        end
      end

      def multi_page?
          #puts "SERIA MULTI PAGE  #{page_size}/#{results_count}"
        return false unless @result.respond_to?(:size) and @result.size > 1
        return MULTI_PAGE_RESPONSE_KEYS.all? { |key| @result.keys.include?(key) }
      end

      def still_need_to_loop? 
        return true if multi_page? and next_page != nil
        #si necesito loopear y tengo el next lo voy a usar tal cual
      end
      #do error handling here?
    end

  end
  #lacks test
  def initial_response?(raw_path,limit_count=INITIAL_LIMIT_COUNT, offset=INITIAL_OFFSET)
    return true if offset != 0
    #return true if domain was present and limit_count and offset but i need to do path analysys
      #by means of path checking weather my limit_count and domain_provided
  end

  def path_request_builder(raw_path,limit_count=INITIAL_LIMIT_COUNT, offset=INITIAL_OFFSET)
    if initial_response?(raw_path)
      return (@wisphub_api_uri + raw_path + "?limit=#{limit_count}&offset=#{offset}")
    else
      return raw_path  #we are dealing with maybe a response.next_page url
    end
  end

  def get(raw_path,limit_count=INITIAL_LIMIT_COUNT, offset=INITIAL_OFFSET)
    begin
      raw_api_response = @faraday_conn.get( path_request_builder(raw_path,limit_count,offset) )
      api_response = ApiResponseParser.new(raw_api_response)  
      multi_page_result = []
      if api_response.multi_page?
        multi_page_result << api_response.result
        if api_response.still_need_to_loop?
          sleep 10
          puts multi_page_result.size
          puts multi_page_result.first
          get(api_response.next)
        else
          return multi_page_result
        end
      else
        return api_response.result
      end



      #por ahora el json nada mas
      #parse as Customer.activerecord (mongodb backed) class, pero esto quiza con el que esta controlando el loop
      #and then persist or better upsert the data
    rescue Faraday::ResourceNotFound
      raise NotFoundError, NOT_FOUND_ERROR_RESPONSE 
    rescue Faraday::UnauthorizedError
      raise UnauthorizedError, UNAUTHORIZED_ERROR_RESPONSE 
    rescue Faraday::ForbiddenError
      raise ForbiddenError, FORBIDDEN_ERROR_RESPONSE 
    rescue Faraday::UnprocessableEntityError
      raise UnprocessableEntityError,  "HTTP 422 UnprocessableEntityError #{response.inspect}"
    rescue Faraday::ServerError => e
      raise InternalServerError, "An unexpected ServerError has occured #{e.inspect}"
    rescue  => e
      puts e.inspect
      case raw_api_response.status
      when 401
        raise UnauthorizedError, UNAUTHORIZED_ERROR_RESPONSE 
      when 403
        raise ForbiddenError, FORBIDDEN_ERROR_RESPONSE 
      when 404
        raise NotFoundError, NOT_FOUND_ERROR_RESPONSE
      when 422
        raise UnprocessableEntityError,  "HTTP 422 UnprocessableEntityError #{raw_api_response.inspect}"
      when 500
        raise InternalServerError, "An unexpected ServerError has occured #{e.inspect}"
      else
      #puts response.body
        raise InternalServerError, "An unexpected error has occured #{response.inspect} #{e.inspect}"
      end
    end
  end
end
  #def with_pagination(raw_path,limit_count=INITIAL_LIMIT_COUNT, offset=INITIAL_OFFSET)
  #  #still needs to sanitize the raw_path
  #  if first_time_called?(limit_count,offset)
  #    return (@wisphub_api_uri + raw_path + "?limit=#{limit_count}&offset=#{offset}")
  #  end
  #end


    #with_pagination(raw_path,limit_count,offset)))
      #initial_response = @faraday_conn.get(with_pagination(raw_path))
      #initial_response = @faraday_conn.get(with_pagination(with_pagination(raw_path,limit_count,offset)))
          #if offset == 0
          #  offset = page_size
          #end
          #count = page_size
          #puts "SERIA MULTI PAGE  #{page_size}/#{results_count}"
            #get(raw_path,limit_count, offset)
    #def multi_page?
    #  return multi_page_api_response_keys.all? { |key| @result.keys.include?(key) }
    #end
      #response = @faraday_conn.get(@wisphub_api_uri + path)
  #end

  #def list_get(path)
  #response = @faraday_conn.get(with_pagination(path))
  #def get(path, api_browse=false)
      #response = @faraday_conn.get(with_pagination(path))
