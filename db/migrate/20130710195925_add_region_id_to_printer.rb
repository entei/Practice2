class AddRegionIdToPrinter < ActiveRecord::Migration
  def change
    add_column :printers, :region_id, :integer
  end
end
