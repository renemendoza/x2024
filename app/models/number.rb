class Number < ApplicationRecord
  belongs_to :carrier, class_name: 'Entity', foreign_key: 'carrier_id'
  belongs_to :customer, class_name: 'Entity', foreign_key: 'customer_id'
  self.table_name = 'db_aliases'
  #tal vez customer puede venir del dominio

end
