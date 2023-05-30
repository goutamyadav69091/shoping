class RemoveColumnFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :user_id
    remove_column :orders, :product_id
    remove_column :orders, :product_qty
    remove_column :orders, :grand_total
    add_reference :orders, :cart, null: false, foreign_key: true
  end
end
