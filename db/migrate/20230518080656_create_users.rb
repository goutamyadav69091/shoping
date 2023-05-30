class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :contact
      t.string :password
      t.string :is_admin

      t.timestamps
    end
  end
end
