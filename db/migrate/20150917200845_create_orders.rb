class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer  :item_id
      t.integer  :user_id
      t.integer  :quantity, default: 0

      t.timestamps null: false
    end
  end
end
