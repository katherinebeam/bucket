class ChangeBucketListToBucketListId < ActiveRecord::Migration
  def change
    rename_column :post_attachments, :bucket_list, :bucket_list_id
  end
end
