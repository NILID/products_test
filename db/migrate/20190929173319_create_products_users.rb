class CreateProductsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :products_users, id: false do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end
end
