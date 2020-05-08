class AddRememberCheckToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_check, :boolean
  end
end
