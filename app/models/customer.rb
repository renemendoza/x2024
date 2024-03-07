class Customer

  attr_accessor :servicio_id, :estado, :facturas_pagadas, :fecha_registro 
  attr_accessor :fecha_instalacion, :fecha_cancelacion, :plan_internet_id, :comentarios
  attr_accessor  :zona, :coordenadas, :ip, :asesor, :nombre, :estado_facturas, :saldo

  INITIAL_OFFSET=0
  INITIAL_LIMIT_COUNT=5

#  CUSTOMER_KEYS= %w(estado facturas_pagadas fecha_registro fecha_instalacion
#  fecha_cancelacion plan_internet_id comentarios zona coordenadas ip asesor usuario)

#  def keys
#    return CUSTOMER_KEYS
#  end

  def initialize(data)
    @servicio_id = data.delete "id_servicio"
    data.collect do |key,value|
      instance_variable_set("@#{key}".to_sym, value) unless key.nil?
    end
  end

  def self.from_wisphub
    results = load_segment(10)
    results.collect do |row|
      Customer.new row
    end
  end

  def self.load_segment(limit_count=INITIAL_LIMIT_COUNT, offset=INITIAL_OFFSET)
    customer_data = WisphubApiConnection.make_request("clientes/?limit=#{limit_count}&offset=#{offset}")
    return customer_data['results']
  end


  def self.load(customer_id)
    customer_data = WisphubApiConnection.make_request("clientes/#{customer_id}/")
    customer = Customer.new(*
      customer_data.slice(
        *%w(id_servicio estado facturas_pagadas fecha_registro) ).values
    )

    return customer
  end

end

    #@customers = Customer.all
    #customer = WisphubApiConnection.make_request('clientes/429/')

 # def self.load_count(limit_count=4)
 #   customers = []
 # #  loop do
 # #))  #return [ Customer.load(429) ]
 #   data = Customer.load_segment
 # return [ customer._load_segment ]
 # #response = Faraday.get(api_url, { limit: limit, offset: offset })
 # #  return customer_data
 # #  sleep(10)  # Wait for 10 seconds before making the next request
 # #else
 # #  puts "API request failed with status: #{response.status}"
 # #  break
 # #end
 # #  #end



 #   #low_count

##require 'faraday'
##require 'json'
## Define the API endpoint
##api_url = 'https://api.example.com/data'
## Initialize variables
##limit = 10  # Number of records to retrieve per request
###offset = 0  # Initial offset
##total_records = 0
##all_results = []
##loop do
##  # Make a GET request to the API with the limit and offset parameters
##  response = Faraday.get(api_url, { limit: limit, offset: offset })
##  if response.success?
##    data = JSON.parse(response.body)
##    
##    total_records = data['count'] if total_records.zero?  # Set total records on the first request    
##    # Append the results to the array
##    all_results.concat(data['results'])
##    
##    # Update the offset for the next request
##    offset += limit    
##    break if all_results.size >= total_records  # Exit the loop if all records are retrieved    
##    sleep(10)  # Wait for 10 seconds before making the next request
##  else
##    puts "API request failed with status: #{response.status}"
##    break
##  end
##


 #   #customer_data["results"].each do |cust_data|
 #   #  %w(id_servicio estado fecha_registro).each do |k|
 #   #    puts cust_data[k]
 #   #  end
 #    # customer = Customer.new( 

 #    #                         * cust_data.slice( *%w(id_servicio estado facturas_pagadas fecha_registro) ).values)
##      %w(fecha_instalacion fecha_cancelacion plan_internet_id comentarios zona coordenadas ip asesor).each do |key|
##        customer.instance_variable_set("@#{key}".to_sym, cust_data[key])
 #     #customers << customer
 #   #end
 #   #return customers
 #   #@customers = Customer.all
 #   #@customers= WisphubApiConnection.make_request('clientes/429/')
 # end



 # :ip,
 # :coordenadas,
 # :estado,
 # :usuario_cpe,
 # :password_cpe,
 # :protocolo_conexion_cpe,
 # :mac_cpe,
 # :interfaz_lan,
 # :ip_router_wifi,
 # :modelo_router_wifi,
 # :usuario_router_wifi,
 # :password_router_wifi,
 # :ssid_router_wifi,
 # :password_ssid_router_wifi,
 # :mac_router_wifi,
 # :sn_onu,
 # :facturas_pagadas,
 # :firewall,
 # :auto_activar_servicio,
 # :forma_contratacion,
 # :fecha_registro,
 # :fecha_instalacion,
 # :fecha_cancelacion,
 # :comentarios,
 # :zona,
 # :router,
 # :sectorial,
 # :modelo_antena,
 # :plan_internet,
 # :asesor,
 # :tecnico
#
