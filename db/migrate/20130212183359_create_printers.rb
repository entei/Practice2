class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :device
      t.string :printer_model
      t.string :printer_type
      t.string :page_format
      t.string :chroma
      t.string :source
      t.date :commissioning
      t.string :task
      t.date :decommissioning
      t.string :comment

      t.timestamps
    end
  end
end
