class AddStationIdToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :station_id, :integer
    add_index :computers, :station_id
  end
end
