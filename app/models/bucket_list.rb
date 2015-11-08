class BucketList < ActiveRecord::Base
  has_many :bucketlist_items

  validates :title, presence: true
  validates :title, length: { minimum: 3 }
  validates :description, presence: true
  validates :description, length: { minimum: 5 }

end
