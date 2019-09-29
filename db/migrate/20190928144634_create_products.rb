class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :domain, default: nil
      t.string :device, default: nil
      t.string :os, default: nil

      t.timestamps
    end
  end
end
