class Client < ActiveRecord::Base
  has_many :borads

  validates :name, presence: true
  validates :address, presence: true
  validates :port, presence: true
end
