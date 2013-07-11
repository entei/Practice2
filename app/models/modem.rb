class Modem < ActiveRecord::Base
  attr_accessible :comment, :commissioning, :decommissioning,
                  :model, :modem_type, :source, :speed, :task , :station_id, :district_id, :region_id
  belongs_to :station
  belongs_to :district
  belongs_to :region

  def retirement?
    self.decommissioning  < Date.today
  end
end
