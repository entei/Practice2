class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :district_id

      t.timestamps
    end
    add_index :stations, :district_id
  end
end
