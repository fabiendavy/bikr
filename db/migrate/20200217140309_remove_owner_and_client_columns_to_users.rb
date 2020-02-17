class RemoveOwnerAndClientColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :owner
    remove_column :users, :client
  end
end
