class AddCommentCounterToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :comments_count, :integer, default: 0
  end
end
