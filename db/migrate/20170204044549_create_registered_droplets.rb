class CreateRegisteredDroplets < ActiveRecord::Migration[5.0]
  def change
    create_table :registered_droplets do |t|
      t.string :name
      t.integer :droplet_id

      t.timestamps
    end
  end
end
