class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :content
      t.integer :position
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
