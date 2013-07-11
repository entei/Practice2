class AddRegionIdToModem < ActiveRecord::Migration
  def change
    add_column :modems, :region_id, :integer
  end
end
