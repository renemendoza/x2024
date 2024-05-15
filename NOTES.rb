

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



./ngrok http 9393   #rails port
ngrok http 9393
ngrok config add-authtoken NGROK_AUTHTOKEN
ngrok http 9393




mysql> describe ip_authenticated;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id         | int(11)      | NO   |     | 0       |       |
| grp        | int(11)      | YES  |     | NULL    |       |
| owner_type | varchar(8)   | NO   |     |         |       |
| owner_id   | int(11)      | YES  |     | NULL    |       |
| owner_name | varchar(255) | YES  |     | NULL    |       |
| ip_addr    | varchar(255) | YES  |     | NULL    |       |
| mask       | int(11)      | YES  |     | NULL    |       |
| port       | int(11)      | YES  |     | NULL    |       |
| tag        | varchar(11)  | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
9 rows in set (0.00 sec)

mysql> show create view ip_authenticated;
|  CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ip_authenticated` AS select `voip_devices`.`id` AS `id`,`toint`(1) AS `grp`,'carrier' AS `owner_type`,`voip_devices`.`carrier_id` AS `owner_id`,`carriers`.`name` AS `owner_name`,`voip_devices`.`host` AS `ip_addr`,`toint`(32) AS `mask`,`toint`(0) AS `port`,cast(`voip_devices`.`id` as char charset utf8) AS `tag` from (`voip_devices` join `carriers` on((`carriers`.`id` = `voip_devices`.`carrier_id`))) where ((`voip_devices`.`sti` = 'Trunk') and (`voip_devices`.`carrier_id` is not null)) union select `voip_devices`.`id` AS `id`,`toint`(2) AS `grp`,'customer' AS `owner_type`,`voip_devices`.`customer_id` AS `owner_id`,`customers`.`name` AS `owner_name`,`voip_devices`.`host` AS `ip_addr`,`toint`(32) AS `mask`,`toint`(0) AS `port`,cast(`voip_devices`.`id` as char charset utf8) AS `tag` from (`voip_devices` join `customers` on((`customers`.`id` = `voip_devices`.`customer_id`))) where ((`voip_devices`.`host` <> 'dynamic') and (isnull(`voip_devices`.`sti`) or (`voip_devices`.`sti` <> 'Trunk')) and (`voip_devices`.`customer_id` is not null) and (`customers`.`active` = 1))




mysql> select * from ip_authenticated;
+------+------+------------+----------+------------------------------+--------------------------------+------+------+------+
| id   | grp  | owner_type | owner_id | owner_name                   | ip_addr                        | mask | port | tag  |
+------+------+------------+----------+------------------------------+--------------------------------+------+------+------+
|  541 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.112                  |   32 |    0 | 541  |
|  571 |    1 | carrier    |       61 | Voztovoice                   | sip.voztovoice.eu              |   32 |    0 | 571  |
|  581 |    1 | carrier    |      302 | Voztovoice Dialer            | sip1.voztovoice.eu             |   32 |    0 | 581  |
|  591 |    1 | carrier    |       71 | Voxbeam                      | sbc.voxbeam.com                |   32 |    0 | 591  |
|  921 |    1 | carrier    |      101 | Ladera                       | 216.89.76.113                  |   32 |    0 | 921  |
|  931 |    1 | carrier    |      101 | Ladera                       | 66.42.61.19                    |   32 |    0 | 931  |
| 1021 |    1 | carrier    |      101 | Ladera                       | sip7.laderacom.com             |   32 |    0 | 1021 |
| 1031 |    1 | carrier    |       61 | Voztovoice                   | 50.116.31.15                   |   32 |    0 | 1031 |
| 1681 |    1 | carrier    |      101 | Ladera                       | 162.242.149.36                 |   32 |    0 | 1681 |
| 1751 |    1 | carrier    |      141 | IDT                          | 66.33.147.149                  |   32 |    0 | 1751 |
| 1761 |    1 | carrier    |      141 | IDT                          | 216.53.4.1                     |   32 |    0 | 1761 |
| 3291 |    1 | carrier    |       61 | Voztovoice                   | 173.255.199.156                |   32 |    0 | 3291 |
| 3301 |    1 | carrier    |      211 | IXC                          | peer.ixc.us                    |   32 |    0 | 3301 |
| 3442 |    1 | carrier    |      211 | IXC                          | 192.40.220.12                  |   32 |    0 | 3442 |
| 3452 |    1 | carrier    |      201 | Interdigita Cloud            | 104.236.78.107                 |   32 |    0 | 3452 |
| 3471 |    1 | carrier    |      101 | Ladera                       | 208.73.233.38                  |   32 |    0 | 3471 |
| 3501 |    1 | carrier    |      221 |  Lightup Network             | 45.58.45.24                    |   32 |    0 | 3501 |
| 3511 |    1 | carrier    |      151 | TollFreeForwarding           | 216.52.221.140                 |   32 |    0 | 3511 |
| 3521 |    1 | carrier    |      151 | TollFreeForwarding           | 205.207.0.100                  |   32 |    0 | 3521 |
| 3531 |    1 | carrier    |      231 | Alcazar Networks             | tollfree.alcazarnetworks.com   |   32 |    0 | 3531 |
| 3541 |    1 | carrier    |      241 | Twilio                       | 54.172.60.0                    |   32 |    0 | 3541 |
| 3551 |    1 | carrier    |      241 | Twilio                       | 54.172.60.1                    |   32 |    0 | 3551 |
| 3561 |    1 | carrier    |      241 | Twilio                       | 54.172.60.2                    |   32 |    0 | 3561 |
| 3571 |    1 | carrier    |      241 | Twilio                       | 54.172.60.3                    |   32 |    0 | 3571 |
| 3581 |    1 | carrier    |      241 | Twilio                       | 54.244.51.0                    |   32 |    0 | 3581 |
| 3591 |    1 | carrier    |      241 | Twilio                       | 54.244.51.1                    |   32 |    0 | 3591 |
| 3601 |    1 | carrier    |      241 | Twilio                       | 54.244.51.2                    |   32 |    0 | 3601 |
| 3611 |    1 | carrier    |      241 | Twilio                       | 54.244.51.3                    |   32 |    0 | 3611 |
| 3621 |    1 | carrier    |      241 | Twilio                       | 177.71.206.192                 |   32 |    0 | 3621 |
| 3631 |    1 | carrier    |      241 | Twilio                       | 177.71.206.193                 |   32 |    0 | 3631 |
| 3641 |    1 | carrier    |      241 | Twilio                       | 177.71.206.194                 |   32 |    0 | 3641 |
| 3651 |    1 | carrier    |      241 | Twilio                       | 177.71.206.195                 |   32 |    0 | 3651 |
| 3771 |    1 | carrier    |      261 | Maxcom                       | 201.157.124.34                 |   32 |    0 | 3771 |
| 3791 |    1 | carrier    |      221 |  Lightup Network             | 35.164.124.183                 |   32 |    0 | 3791 |
| 3841 |    1 | carrier    |      271 | VoxNumbers                   | 54.236.119.42                  |   32 |    0 | 3841 |
| 4262 |    1 | carrier    |      161 | Alestra                      | 201.151.64.73                  |   32 |    0 | 4262 |
| 4282 |    1 | carrier    |      161 | Alestra                      | 201.151.64.73                  |   32 |    0 | 4282 |
| 4292 |    1 | carrier    |      161 | Alestra                      | 200.76.5.138                   |   32 |    0 | 4292 |
| 4302 |    1 | carrier    |      201 | Interdigita Cloud            | 104.131.111.102                |   32 |    0 | 4302 |
| 4312 |    1 | carrier    |      282 | Marcatel                     | 201.168.128.52                 |   32 |    0 | 4312 |
| 4331 |    1 | carrier    |       51 | Flowroute                    | 170.167.153.130                |   32 |    0 | 4331 |
| 4371 |    1 | carrier    |      101 | Ladera                       | 208.73.236.38                  |   32 |    0 | 4371 |
| 4441 |    1 | carrier    |      291 | VoipPro                      | 77.72.174.132                  |   32 |    0 | 4441 |
| 4451 |    1 | carrier    |      301 | Anveo                        | sbc.anveo.com                  |   32 |    0 | 4451 |
| 4496 |    1 | carrier    |      201 | Interdigita Cloud            | 142.93.75.130                  |   32 |    0 | 4496 |
| 4501 |    1 | carrier    |      303 |  BridgeVoice                 | 204.15.169.91                  |   32 |    0 | 4501 |
| 4503 |    1 | carrier    |      305 | TELECOMXCHANGE-TATA          | sip01.telecomsxchange.com      |   32 |    0 | 4503 |
| 4511 |    1 | carrier    |      101 | Ladera                       | 208.73.232.38                  |   32 |    0 | 4511 |
| 4513 |    1 | carrier    |      101 | Ladera                       | 208.73.234.38                  |   32 |    0 | 4513 |
| 4517 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.33                   |   32 |    0 | 4517 |
| 4519 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.34                   |   32 |    0 | 4519 |
| 4521 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.35                   |   32 |    0 | 4521 |
| 4523 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.36                   |   32 |    0 | 4523 |
| 4525 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.37                   |   32 |    0 | 4525 |
| 4527 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.38                   |   32 |    0 | 4527 |
| 4529 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.39                   |   32 |    0 | 4529 |
| 4531 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.40                   |   32 |    0 | 4531 |
| 4533 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.41                   |   32 |    0 | 4533 |
| 4535 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.42                   |   32 |    0 | 4535 |
| 4537 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.43                   |   32 |    0 | 4537 |
| 4539 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.44                   |   32 |    0 | 4539 |
| 4541 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.45                   |   32 |    0 | 4541 |
| 4543 |    1 | carrier    |       51 | Flowroute                    | 34.226.36.46                   |   32 |    0 | 4543 |
| 4545 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.113                  |   32 |    0 | 4545 |
| 4547 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.114                  |   32 |    0 | 4547 |
| 4549 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.115                  |   32 |    0 | 4549 |
| 4551 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.116                  |   32 |    0 | 4551 |
| 4553 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.117                  |   32 |    0 | 4553 |
| 4555 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.118                  |   32 |    0 | 4555 |
| 4557 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.119                  |   32 |    0 | 4557 |
| 4559 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.120                  |   32 |    0 | 4559 |
| 4561 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.121                  |   32 |    0 | 4561 |
| 4563 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.122                  |   32 |    0 | 4563 |
| 4565 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.123                  |   32 |    0 | 4565 |
| 4567 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.124                  |   32 |    0 | 4567 |
| 4569 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.125                  |   32 |    0 | 4569 |
| 4571 |    1 | carrier    |       51 | Flowroute                    | 34.210.91.126                  |   32 |    0 | 4571 |
| 4579 |    1 | carrier    |      101 | Ladera                       | 208.89.105.125                 |   32 |    0 | 4579 |
| 4583 |    1 | carrier    |      101 | Ladera                       | 208.89.106.29                  |   32 |    0 | 4583 |
| 4587 |    1 | carrier    |      307 | Celerity                     | 38.94.46.5                     |   32 |    0 | 4587 |
| 4591 |    1 | carrier    |      241 | Twilio                       | zefironetworks.pstn.twilio.com |   32 |    0 | 4591 |
| 4593 |    1 | carrier    |      309 | Prescott Martini             | 38.95.11.252                   |   32 |    0 | 4593 |
| 4595 |    1 | carrier    |      309 | Prescott Martini             | 208.78.161.100                 |   32 |    0 | 4595 |
|   71 |    2 | customer   |        3 | Vacacionando.com             | 200.34.66.132                  |   32 |    0 | 71   |
|  161 |    2 | customer   |        3 | Vacacionando.com             | 187.157.176.147                |   32 |    0 | 161  |
|  171 |    2 | customer   |       32 | Promotora Sunset Beach Clubs | 200.34.66.131                  |   32 |    0 | 171  |
|  331 |    2 | customer   |        3 | Vacacionando.com             | 200.79.231.141                 |   32 |    0 | 331  |
|  961 |    2 | customer   |        3 | Vacacionando.com             | 200.34.66.130                  |   32 |    0 | 961  |
| 3221 |    2 | customer   |        3 | Vacacionando.com             | 201.166.131.158                |   32 |    0 | 3221 |
| 3661 |    2 | customer   |        1 | Zefiro Networks              | 45.174.98.22                   |   32 |    0 | 3661 |
| 3741 |    2 | customer   |      361 | Interdigita                  | pedregal.pbx.interdigita.com   |   32 |    0 | 3741 |
| 3881 |    2 | customer   |        3 | Vacacionando.com             | 138.68.8.33                    |   32 |    0 | 3881 |
| 3952 |    2 | customer   |     1761 | CLUB DE SERVICIOS TURISTICOS | 1.1.1.1                        |   32 |    0 | 3952 |
| 3972 |    2 | customer   |        3 | Vacacionando.com             | 177.237.60.194                 |   32 |    0 | 3972 |
| 3982 |    2 | customer   |        3 | Vacacionando.com             | 138.68.251.181                 |   32 |    0 | 3982 |
| 4002 |    2 | customer   |      361 | Interdigita                  | test.pbx.interdigita.com       |   32 |    0 | 4002 |
| 4391 |    2 | customer   |     2201 | Isola-1401                   | isola1401.pbx.interdigita.com  |   32 |    0 | 4391 |
| 4411 |    2 | customer   |     2211 | Ecollection                  | 165.22.41.79                   |   32 |    0 | 4411 |
| 4471 |    2 | customer   |        3 | Vacacionando.com             | 189.206.164.254                |   32 |    0 | 4471 |
| 4495 |    2 | customer   |        3 | Vacacionando.com             | 187.157.232.170                |   32 |    0 | 4495 |
| 4497 |    2 | customer   |     2391 | FUNDACION AITANA             | aitana.pbx.interdigita.com     |   32 |    0 | 4497 |
| 4499 |    2 | customer   |        3 | Vacacionando.com             | 138.197.197.53                 |   32 |    0 | 4499 |
| 4507 |    2 | customer   |        3 | Vacacionando.com             | 64.225.6.218                   |   32 |    0 | 4507 |
| 4515 |    2 | customer   |     2211 | Ecollection                  | 161.35.176.36                  |   32 |    0 | 4515 |
| 4577 |    2 | customer   |     2211 | Ecollection                  | 167.172.244.26                 |   32 |    0 | 4577 |
| 4581 |    2 | customer   |     2211 | Ecollection                  | 161.35.190.103                 |   32 |    0 | 4581 |
| 4589 |    2 | customer   |        3 | Vacacionando.com             | 137.184.15.115                 |   32 |    0 | 4589 |
+------+------+------------+----------+------------------------------+--------------------------------+------+------+------+
107 rows in set (0.00 sec)

mysql> 
mysql> 
mysql> use x2024_development;
No connection. Trying to reconnect...
Connection id:    200
Current database: *** NONE ***

Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-----------------------------+
| Tables_in_x2024_development |
+-----------------------------+
| acc                         |
| acc_cdrs                    |
| ar_internal_metadata        |
| carrier_trusted             |
| carriers                    |
| customers                   |
| db_aliases                  |
| numbers                     |
| schema_migrations           |
| subscriber                  |
| users                       |
| version                     |
+-----------------------------+
12 rows in set (0.00 sec)


class AddColumnsToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :usuario, :string
    add_column :customers, :nombre, :string
    add_column :customers, :email, :string
    add_column :customers, :cedula, :string
    add_column :customers, :direccion, :string
    add_column :customers, :localidad, :string
    add_column :customers, :ciudad, :string
    add_column :customers, :telefono, :string
    add_column :customers, :descuento, :string
    add_column :customers, :saldo, :float
    add_column :customers, :rfc, :string
    add_column :customers, :informacion_adicional, :string
    add_column :customers, :notificacion_sms, :string
    add_column :customers, :aviso_pantalla, :string
    add_column :customers, :notificaciones_push, :string
    add_column :customers, :auto_activar_servicio, :string
    add_column :customers, :firewall, :string
    add_column :customers, :servicio, :string
    add_column :customers, :password_servicio, :string
    add_column :customers, :server_hotspot, :string
    add_column :customers, :ip, :string
    add_column :customers, :ip_local, :string
    add_column :customers, :estado, :string
    add_column :customers, :modelo_antena, :string
    add_column :customers, :password_cpe, :string
    add_column :customers, :mac_cpe, :string
    add_column :customers, :interfaz_lan, :string
    add_column :customers, :modelo_router_wifi, :string
    add_column :customers, :ip_router_wifi, :string
    add_column :customers, :mac_router_wifi, :string
    add_column :customers, :usuario_router_wifi, :string
    add_column :customers, :password_router_wifi, :string
    add_column :customers, :ssid_router_wifi, :string
    add_column :customers, :password_ssid_router_wifi, :string
    add_column :customers, :comentarios, :string
    add_column :customers, :coordenadas, :string
    add_column :customers, :costo_instalacion, :float
    add_column :customers, :precio_plan, :float
    add_column :customers, :forma_contratacion, :string
    add_column :customers, :sn_onu, :string
    add_column :customers, :estado_facturas, :string
    add_column :customers, :fecha_instalacion, :datetime
    add_column :customers, :fecha_cancelacion, :datetime
    add_column :customers, :fecha_corte, :datetime
    add_column :customers, :ultimo_cambio, :string
    add_column :customers, :plan_internet, :string
    add_column :customers, :zona, :string
    add_column :customers, :router, :string
    add_column :customers, :sectorial, :string
    add_column :customers, :tecnico, :string
    add_column :customers, :string, :string
    add_column :customers, :servicio_id, :string
    add_column :customers, :usuario_cpe, :string
    add_column :customers, :protocolo_conexion_cpe, :string
    add_column :customers, :facturas_pagadas, :string
    add_column :customers, :fecha_registro, :datetime
    add_column :customers, :asesor, :string
  end
end

  # def initialize(data)
  #   #@servicio_id = data.delete "id_servicio"
  #   data.collect do |key,value|
  #     instance_variable_set("@#{key}".to_sym, value) unless key.nil?
  #   end
  # end
  #
  #
  # def self.wisphub_get(customer_id=429)
  #   api = WisphubApiConnection.new
  #   return api.get("/clientes/#{customer_id}")
  #   #deberia parsearlo aqui
  #   #return api.get("/clientes/#{customer_id}")
  # end
  #
  # def self.wisphub_get_list(page_size=nil)
  #   api = WisphubApiConnection.new
  #  # return api.get_clients() #a list of instantiated clients
  #   return api.get("/clientes/", page_size)
  #
  #     #parse as Customer.activerecord (mongodb backed) class, pero esto quiza con el que esta controlando el loop
      #and then persist or better upsert the data
  # end





#  attr_accessor :servicio_id, :estado, :facturas_pagadas, :fecha_registro 
#  attr_accessor :fecha_instalacion, :fecha_cancelacion, :plan_internet_id, :comentarios
#  attr_accessor  :zona, :coordenadas, :ip, :asesor, :nombre, :estado_facturas, :saldo
#
#  INITIAL_OFFSET=0
#  INITIAL_LIMIT_COUNT=5
#
#  CUSTOMER_KEYS= %w(estado facturas_pagadas fecha_registro fecha_instalacion
#  fecha_cancelacion plan_internet_id comentarios zona coordenadas ip asesor usuario)

#  def keys
#    return CUSTOMER_KEYS
#  end



  #def self.load_segment(limit_count=INITIAL_LIMIT_COUNT, offset=INITIAL_OFFSET)
  #  #customer_data = WisphubApiConnection.make_request("clientes/?limit=#{limit_count}&offset=#{offset}")
  #  customer_data = WisphubApiConnection.new.get("/clientes/")
  #  return customer_data['results']
  #end

  #customer = WisphubApiConnection.make_request('clientes/429/')

    #@customers = Customer.all
    #customer = WisphubApiConnection.make_request('clientes/429/')
    #@customers = Customer.all
    #customer = WisphubApiConnection.make_request('clientes/429/')

#  def self.from_wisphub
#    results = load_segment(10)
#    results.collect do |row|
#      Customer.new row
#    end
#  end
#
#  def self.load_segment(limit_count=INITIAL_LIMIT_COUNT, offset=INITIAL_OFFSET)
#    customer_data = WisphubApiConnection.make_request("clientes/?limit=#{limit_count}&offset=#{offset}")
#    return customer_data['results']
#  end
#
#
#  def self.load(customer_id)
#    customer_data = WisphubApiConnection.make_request("clientes/#{customer_id}/")
#    customer = Customer.new(*
#      customer_data.slice(
#        *%w(id_servicio estado facturas_pagadas fecha_registro) ).values
#    )
#
#    return customer
#  end



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
