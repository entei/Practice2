class AddDistrictIdToPrinter < ActiveRecord::Migration
  def change
    add_column :printers, :district_id, :integer
  end
end
