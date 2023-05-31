class CreateOrders < ActiveRecord::Migration[7.0]
	def change
		create_table :orders do |t|
			t.references :cart, null: false, foreign_key: true
			t.references :user, null: false, foreign_key: true
			t.string :shiping_address
			t.string :billing_address
			t.integer :payment_mode, default: 0
			t.integer :order_status, default: 0
			t.integer :amount 

			t.timestamps
		end
	end
end
