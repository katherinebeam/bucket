class AddUserIdToBucketLists < ActiveRecord::Migration
  def change
    add_column :bucket_lists, :user_id, :integer
    add_index :bucket_lists, :user_id
  end
end
