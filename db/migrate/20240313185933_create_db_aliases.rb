class CreateDbAliases < ActiveRecord::Migration[7.1]
  def change
    create_table :db_aliases do |t|
      t.string :alias_username
      t.string :alias_domain
      t.string :username
      t.string :domain


      t.timestamps
    end
  end
end
