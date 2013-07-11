class Device < ActiveRecord::Base
  attr_accessible :comment, :commissioning, :decommissioning,
                  :device_model, :device_type, :source, :task , :station_id, :district_id, :region_id
  belongs_to :station
  belongs_to :district
  belongs_to :region



  def retirement?
           self.decommissioning  < Date.today
  end

end
