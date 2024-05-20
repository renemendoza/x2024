class Domain < ApplicationRecord
  belongs_to :customer, class_name: 'Entity', foreign_key: 'customer_id'

  def self.Names
    all.map(&:name)
  end

  def self.WithCustomerNames
    all.includes(:customer)
  end
  #mostly for customers, because do carriers
#  have domains?
  #belons_to Entity as Customer  via customer.id = entity.id
end
