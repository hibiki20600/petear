class CreateGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :goods do |t|
      t.references :message, foreign_key: true
      t.references :user, foreign_key: true
      t.index [:user_id, :message_id], unique: true
      t.timestamps
    end
  end
end
