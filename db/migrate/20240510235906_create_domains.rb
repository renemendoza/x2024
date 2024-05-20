class CreateDomains < ActiveRecord::Migration[7.1]
  def change
    create_table :domains do |t|
      t.string :name
      t.integer :customer_id
      t.integer :carrier_id
      t.timestamps
    end
  end
end
