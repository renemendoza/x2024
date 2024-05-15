class CreateVoipTrunks < ActiveRecord::Migration[7.1]
  def change
    create_table :voip_trunks do |t|
      t.string :name
      t.string :host
      t.string :tag
      t.integer :entity_id
      t.integer :entity_group
      t.integer :mask
      t.integer :port

      t.timestamps
    end
  end
end
