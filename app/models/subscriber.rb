class Subscriber < ApplicationRecord
  belongs_to :customer, class_name: 'Entity', foreign_key: 'customer_id'

  def self.WithCustomerNames
    all.includes(:customer)
  end
end
