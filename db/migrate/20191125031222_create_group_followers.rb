class CreateGroupFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_followers do |t|
      t.references :group, foreign_key: true
      t.references :follower, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
