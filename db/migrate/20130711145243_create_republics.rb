class CreateRepublics < ActiveRecord::Migration
  def change
    create_table :republics do |t|

      t.timestamps
    end
  end
end
