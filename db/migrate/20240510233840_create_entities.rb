class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :email
      t.string :street_address
      t.string :street_address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :entity_group

      t.timestamps
    end
  end
end
