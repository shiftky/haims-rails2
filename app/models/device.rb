class Device < ActiveRecord::Base
  has_many :ir_signals, dependent: :delete_all

  validates :name, presence: true
end
