class AddCompletedAtToBucketlistItems < ActiveRecord::Migration
  def change
    add_column :bucketlist_items, :completed_at, :datetime
  end
end
