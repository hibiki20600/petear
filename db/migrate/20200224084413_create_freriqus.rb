class CreateFreriqus < ActiveRecord::Migration[5.0]
  def change
    create_table :freriqus do |t|
      t.references :invite,  foreign_key: { to_table: :users }
      t.references :invited, foreign_key: { to_table: :users }
      t.index [:invite_id, :invited_id], unique: true
      t.timestamps
    end
  end
end
