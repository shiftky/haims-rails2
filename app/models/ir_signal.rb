class IrSignal < ActiveRecord::Base
  belongs_to :device

  validates :name, presence: true
  validates :signal, presence: true
  validates :device_id, presence: true
  validates :board_id, presence: true
end
