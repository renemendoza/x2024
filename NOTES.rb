

nvim debugger es 
DAP = "https://github.com/mfussenegger/nvim-dap"

instalar `0000marcell/nvim-dap-ruby`
from "https://github.com/0000marcell/nvim-ruby-dap-configuration/blob/master/nvim/init.lua"
con requerimientos 
    `theHamsta/nvim-dap-virtual-text`   # ?
    `rcarriga/nvim-dap-ui`   # ?
    `nvim-telescope/telescope-dap`   # ?


nvim_config <<~nvim_config
    config = function()
	        require("nvim-dap-virtual-text").setup {
		        commented = true,
	        }
	        local dap, dapui = require "dap", require "dapui"
	        dap.set_log_level('TRACE')

	        dapui.setup {
		        icons = {},
		        layouts = {
			        {
				        elements = {
					        {
						        id = "watches",
						        size = 1
					        },
				        },
				        position = "bottom",
				        size = 5
			        },
			        {
				        elements = {
					        {
						        id = "scopes",
						        size = 1
					        },
				        },
				        position = "bottom",
				        size = 5
			        }
		        },
	        } -- use default
	        dap.listeners.after.event_initialized["dapui_config"] = function()
		        dapui.open()
	        end
	        dap.listeners.before.event_terminated["dapui_config"] = function()
		        dapui.close()
	        end
	        dap.listeners.before.event_exited["dapui_config"] = function()
		        dapui.close()
	        end

	        require('dap-ruby').setup()
nvim_config


revisar "https://github.com/0000marcell/nvim-dap-ruby/blob/master/lua/dap-ruby.lua"
  porque NO_USAMOS_RSPEC <<~NO_USAMOS_RSPEC
      local function setup_ruby_configuration(dap)
      dap.configurations.ruby = {
        {
           type = 'ruby',
           name = 'debug current file',
           command = "ruby",
           request = "attach",
           script = "${file}",
           options = {
             source_filetype = 'ruby',
           };
           localfs = true,
        },
        {
           type = 'ruby';
           name = 'run rspec current file';
           request = 'attach';
           command = "bin/rspec";
           script = "${file}";
           options = {
             source_filetype = 'ruby';
           };
           localfs = true;
        },
        {
           type = 'ruby';
           name = 'run rspec current_file:current_line';
           bundle = 'bundle';
           request = 'attach';
           command = "bin/rspec";
           script = "${file}";
           port = 38698;
           server = '127.0.0.1';
           options = {
             source_filetype = 'ruby';
           };
           localfs = true;
           waiting = 1000;
           current_line = true;
        }
      }
  NO_USAMOS_RSPEC

:

#require Rails.root.join 'lib/wisphub_api_connection'
#include WispHubAPIConnection

#requested_path = "clientes/429/"

#response_data = WispHubAPIConnection::make_request(requested_path)

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
#WISPHUB_API_URI = 'https://api.wisp.net/api/clientes/429/'

  prompt <<~PROMPT

    I want you to act as a software developer
    I will provide some specific information about an existing ruby on rails web app requirements,
    and it will be your job to come up with an architecture and code for developing secure app with Ruby on Rails and HTMX

    My first request is 'I want a system that will query the `wisphub` api at uri: `http://localhost/clientes/429`
    periodically in minutes and create a active record cache of sorts that is shown to the users as tables that refresh using htmx periodically in seconds
    here is an example of the API call using `curl` you need to make to create and update your cache

        `curl --location --request GET 'https://apiwisp.net/api/clientes/429/'  --header 'Authorization: Api-Key  MYKEY1234567890'` 

  PROMPT

#{"id_servicio"=>429, "ip"=>"100.100.34.217", "coordenadas"=>"", "estado"=>"Activo", "usuario_cpe"=>"", "password_cpe"=>"", "protocolo_conexion_cpe"=>"", "mac_cpe"=>"BC:E6:7C:00:8B:09", "interfaz_lan"=>"vlan16", "ip_router_wifi"=>nil, "m
#odelo_router_wifi"=>"", "usuario_router_wifi"=>"", "password_router_wifi"=>"", "ssid_router_wifi"=>"", "password_ssid_router_wifi"=>"", "mac_router_wifi"=>"", "sn_onu"=>"", "facturas_pagadas"=>true, "firewall"=>true, "auto_activar_servi
#cio"=>false, "forma_contratacion"=>"otros", "fecha_registro"=>"08/30/2021 17:33:38", "fecha_instalacion"=>"12/09/2021 15:14:00", "fecha_cancelacion"=>nil, "comentarios"=>"", "zona"=>{"id"=>35760, "nombre"=>"Villas Del Mar 3"}, "router"=
#>{"id"=>31575, "nombre"=>"Villas Del Mar 3"}, "sectorial"=>nil, "modelo_antena"=>nil, "plan_internet"=>{"id"=>110189, "nombre"=>"ACTIVOS"}, "asesor"=>{"id"=>876773, "nombre"=>"Erick "}, "tecnico"=>{"id"=>876773, "nombre"=>"Eric
# "}}




