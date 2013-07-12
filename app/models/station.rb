class Station < ActiveRecord::Base
  attr_accessible :name, :district_id, :region_id
  
  belongs_to :district
  belongs_to :region

  has_many :computers, :dependent => :destroy
  has_many :devices, :dependent => :destroy
  has_many :modems, :dependent => :destroy
  has_many :printers, :dependent => :destroy
  validates :name, :presence => :true


  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
