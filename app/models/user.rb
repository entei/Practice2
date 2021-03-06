require 'digest'
class User < ActiveRecord::Base
  #attr_accessor :name, :password_digest
  attr_accessible :name, :password, :password_confirmation

  validates :name, :presence => :true, :uniqueness => :true
  has_secure_password
  after_destroy :ensure_an_admin_remains

  private

  def ensure_an_admin_remains
    if User.count.zero?
     # raise "Последний пользователь не может быть удален"
    end
  end
end
