class Region < ActiveRecord::Base
  attr_accessible :name

  has_many :computers, :dependent => :destroy
  has_many :devices, :dependent => :destroy
  has_many :modems, :dependent => :destroy
  has_many :printers, :dependent => :destroy
  has_many :districts, :dependent => :destroy
  validates :name, :presence => :true
end
