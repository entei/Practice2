class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_type
      t.string :device_model
      t.string :source
      t.date :commissioning
      t.string :task
      t.date :decommissioning
      t.string :comment

      t.timestamps
    end
  end
end
