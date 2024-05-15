class VoipTrunk < ApplicationRecord
end
# rails generate model VoipTrunk name:string host:string tag:string owner_id:integer trunk_type_id:integer mask:integer port:integer
# 3. This command will generate a migration file in the `db/migrate` directory with a timestamp and the name of the model (`create_voip_trunks.rb`).
# 4. Open the generated migration file (`db/migrate/[timestamp]_create_voip_trunks.rb`) in a text editor.
# 5. Update the migration file to define the fields with the specified types:
# ```ruby
# class CreateVoipTrunks < ActiveRecord::Migration[6.0]
#   def change
#     create_table :voip_trunks do |t|
#       t.string :name
#       t.string :hos
#       t.string :tag
#       t.integer :owner_id
#       t.integer :trunk_type_id
#       t.integer :mask
#       t.integer :port
#       t.timestamps
#     end
#   end
# end
# ```
# 6. Save the migration file.
# 7. Run the migration to create the `VoipTrunk` table in the database:
#```bash
#rails db:migrate
#```
#After running
#
#end
# rails generate model Entity name:string email:string street_address:string street_address_2:string city state:string zip_code:string_type:integer
# ```
# 3. This command will generate a migration file in the `db/migrate` directory with a timestamp and the name of the model (`create_entities.rb`).
# 4. Open the generated migration file (`db/migrate/[timestamp]_create_entities.rb`) in a text editor.
# 5. Update the migration file to define the fields with the specified types:
# ```ruby
# class CreateEntities < ActiveRecord::Migration[6.0]
#   def change
#     create_table :entities do |t|
#       t.string :name
#       t.string :email
#       t.string :street_address
#       t.string :street_address_2
#       t.string :city
#       t.string :state
#       t.string :zip_code
#       t.integer :entity_type
#       t.timestamps
#     end
#   end
# end
# ```
# 6. Save the migration file.
# 7. Run the migration to create the `Entity` table in the database:
# ```bash
# rails db:migrate
# ```
# After running this migration, you will have a `Entity` model with the specified fields in
#
#
