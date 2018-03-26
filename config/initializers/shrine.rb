require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

s3_options = {
    access_key_id:      ENV['AKIAJ324WGAUXUPBG5EA'],
    secret_access_key:  ENV['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'],
    region:             ENV['us-east-2'],
    bucket:             ENV['kemryfm']
}

Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("tmp/uploads"),
    store: Shrine::Storage::S3.new(upload_options: {acl: "public-read"}, prefix: "store",
                                   **s3_options),
}

Shrine.plugin :activerecord