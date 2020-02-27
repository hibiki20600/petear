class CreateUTagGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :u_tag_groups do |t|
      t.references :u_tag, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
