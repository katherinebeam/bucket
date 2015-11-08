class CreateBucketlistItems < ActiveRecord::Migration
  def change
    create_table :bucketlist_items do |t|
      t.references :bucket_list, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
