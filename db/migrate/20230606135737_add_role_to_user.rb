class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :Integer, null: false, default: 0
  end
end
