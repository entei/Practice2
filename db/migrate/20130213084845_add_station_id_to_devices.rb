class AddStationIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :station_id, :integer
    add_index :devices, :station_id
    
  end

end
