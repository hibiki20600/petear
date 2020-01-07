class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.string :image, null: false
      t.string :tag, null: false
      t.index [:name, :image, :tag], unique: true
      t.timestamps
    end
  end
end
