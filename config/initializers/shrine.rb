require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

s3_options = {
  access_key_id:     Figaro.env.S3_ACCESS_KEY_ID,
  secret_access_key: Figaro.env.S3_SECRET_ACCESS_KEY,
  region:            Figaro.env.S3_REGION,
  bucket:            Figaro.env.S3_BUCKET,
}

Shrine.storages = {
  # cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  # store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
  cache: Shrine::Storage::S3.new(prefix: "cache", upload_options: {acl: "public-read"}, **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", upload_options: {acl: "public-read"}, **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :direct_upload
Shrine.plugin :restore_cached_data
Shrine.plugin :determine_mime_type
Shrine.plugin :cached_attachment_data
Shrine.plugin :logging, logger: Rails.logger
