class AddCommentToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :comment, :string, default: 'user has not comment yet'
  end
end
