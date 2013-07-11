class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :computer_model
      t.string :comp_type
      t.string :comp_class
      t.string :platform
      t.string :processor
      t.float :memory
      t.float :hdd
      t.string :display
      t.string :source
      t.date :commissioning
      t.string :task
      t.date :decommissioning
      t.string :comment

      t.timestamps
    end
  end
end
