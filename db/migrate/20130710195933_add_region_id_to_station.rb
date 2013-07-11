class AddRegionIdToStation < ActiveRecord::Migration
  def change
    add_column :stations, :region_id, :integer
  end
end
