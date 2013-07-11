class AddDistrictIdToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :district_id, :integer
    add_index :devices, :district_id
  end
end
