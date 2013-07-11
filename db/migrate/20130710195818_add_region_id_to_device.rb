class AddRegionIdToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :region_id, :integer
  end
end
