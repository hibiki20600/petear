class AddOwnerIdToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :owner_id, :integer
  end
end
