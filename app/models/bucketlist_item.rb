class BucketlistItem < ActiveRecord::Base
  belongs_to :bucket_list

  validates :content, presence: true,
                      length: { minimum: 2 }
end
