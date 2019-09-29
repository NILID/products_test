class AddMarkToBlocks < ActiveRecord::Migration[5.2]
  def change
    add_column :blocks, :mark, :string
  end
end
