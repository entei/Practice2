class AddDistrictIdToModem < ActiveRecord::Migration
  def change
    add_column :modems, :district_id, :integer
  end
end
