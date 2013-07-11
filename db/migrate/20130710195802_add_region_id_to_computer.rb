class AddRegionIdToComputer < ActiveRecord::Migration
  def change
    add_column :computers, :region_id, :integer
  end
end
