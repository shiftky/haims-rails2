class Client < ActiveRecord::Base
  has_many :boards, dependent: :delete_all

  validates :name, presence: true
  validates :address, presence: true
  validates :port, presence: true
end
