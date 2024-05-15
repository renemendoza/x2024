class CreateSubscribers < ActiveRecord::Migration[7.1]
  def change
    create_table :subscribers do |t|
      t.string :username
      t.string :domain
      t.string :password
      t.string :ha1
      t.string :ha1b
      t.string :rpid
      t.string :display_name
      t.integer :customer_id

      t.timestamps
    end
  end
end
