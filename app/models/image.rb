class Image < ActiveRecord::Base # ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true

  include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
end