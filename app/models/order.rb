class Order < ApplicationRecord
  # serialize :product_id, Array
  # serialize :product_qty, Array
  belongs_to :cart
  belongs_to :user

  enum order_status: {
    placed: 0,
    shipped: 1,
    delivered: 2,
    canceled: 3

  }

end
