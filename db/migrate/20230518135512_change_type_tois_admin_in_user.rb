class ChangeTypeToisAdminInUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.change :is_admin, :boolean
    end
  end
end
