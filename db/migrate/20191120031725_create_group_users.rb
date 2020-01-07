class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.index [:user_id, :group_id], unique: true
      t.timestamps
    end
  end
end
