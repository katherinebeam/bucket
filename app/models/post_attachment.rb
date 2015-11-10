class PostAttachment < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :bucketlist
end
