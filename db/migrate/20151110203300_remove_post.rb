class RemovePost < ActiveRecord::Migration
  def change
    drop_table :posts
    rename_column :post_attachments, :post_id, :bucket_list
  end
end
