class CreateUTags < ActiveRecord::Migration[5.0]
  def change
    create_table :u_tags do |t|
      t.references :user, foreign_key: true
      t.string :tag, null: false
      t.timestamps
    end
  end
end
