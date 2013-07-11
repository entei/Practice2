class CreateModems < ActiveRecord::Migration
  def change
    create_table :modems do |t|
      t.string :model
      t.string :modem_type
      t.string :speed
      t.string :source
      t.date :commissioning
      t.string :task
      t.date :decommissioning
      t.string :comment
      t.integer :station_id

      t.timestamps
    end
    add_index :modems, :station_id
  end
end
