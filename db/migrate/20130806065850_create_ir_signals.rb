class CreateIrSignals < ActiveRecord::Migration
  def change
    create_table :ir_signals do |t|
      t.string :name
      t.text :signal
      t.integer :device_id
      t.integer :board_id

      t.timestamps
    end
  end
end
