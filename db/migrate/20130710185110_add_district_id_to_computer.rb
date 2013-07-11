class AddDistrictIdToComputer < ActiveRecord::Migration
  def change
    add_column :computers, :district_id, :integer
  end
end
