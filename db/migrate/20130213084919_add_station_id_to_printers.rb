class AddStationIdToPrinters < ActiveRecord::Migration
  def change
    add_column :printers, :station_id, :integer
    add_index :printers, :station_id
  end

end
