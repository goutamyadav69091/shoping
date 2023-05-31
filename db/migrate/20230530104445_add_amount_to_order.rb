class AddAmountToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders ,:amount, :integer
    change_column :orders ,:payment_mode, :integer
  end
end
