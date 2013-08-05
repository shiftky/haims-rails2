class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
