class Computer < ActiveRecord::Base
  attr_accessible :comment, :commissioning, :comp_class,
                  :comp_type, :computer_model, :decommissioning,
                  :display, :hdd, :memory, :platform,
                  :processor, :source, :task, :station_id, :district_id, :region_id
  belongs_to :station
  belongs_to :district
  belongs_to :region

  def retirement?
    self.decommissioning < Date.today
  end
end
