class Entity < ApplicationRecord

  def self.Carriers
    where(entity_group: 1) #leer de config
  end

  def self.Customers
    where(entity_group: 2)
  end
end
