# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_13_185933) do
  create_table "customers", force: :cascade do |t|
    t.text "name"
    t.string "usuario"
    t.string "nombre"
    t.string "email"
    t.string "cedula"
    t.string "direccion"
    t.string "localidad"
    t.string "ciudad"
    t.string "telefono"
    t.string "descuento"
    t.float "saldo"
    t.string "rfc"
    t.string "informacion_adicional"
    t.string "notificacion_sms"
    t.string "aviso_pantalla"
    t.string "notificaciones_push"
    t.string "auto_activar_servicio"
    t.string "firewall"
    t.string "servicio"
    t.string "password_servicio"
    t.string "server_hotspot"
    t.string "ip"
    t.string "ip_local"
    t.string "estado"
    t.string "modelo_antena"
    t.string "password_cpe"
    t.string "mac_cpe"
    t.string "interfaz_lan"
    t.string "modelo_router_wifi"
    t.string "ip_router_wifi"
    t.string "mac_router_wifi"
    t.string "usuario_router_wifi"
    t.string "password_router_wifi"
    t.string "ssid_router_wifi"
    t.string "password_ssid_router_wifi"
    t.string "comentarios"
    t.string "coordenadas"
    t.float "costo_instalacion"
    t.float "precio_plan"
    t.string "forma_contratacion"
    t.string "sn_onu"
    t.string "estado_facturas"
    t.datetime "fecha_instalacion"
    t.datetime "fecha_cancelacion"
    t.datetime "fecha_corte"
    t.string "ultimo_cambio"
    t.string "plan_internet"
    t.string "zona"
    t.string "router"
    t.string "sectorial"
    t.string "tecnico"
    t.string "string"
    t.string "servicio_id"
    t.string "usuario_cpe"
    t.string "protocolo_conexion_cpe"
    t.string "facturas_pagadas"
    t.datetime "fecha_registro"
    t.string "asesor"
  end

  create_table "db_aliases", force: :cascade do |t|
    t.string "alias_username"
    t.string "alias_domain"
    t.string "username"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
