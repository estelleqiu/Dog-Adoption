# == Schema Information
#
# Table name: media
#
#  id            :integer          not null, primary key
#  medium_type   :integer
#  mediable_type :string
#  mediable_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  url           :string
#
# Indexes
#
#  index_media_on_mediable_type_and_mediable_id  (mediable_type,mediable_id)
#

class Medium < ApplicationRecord
  belongs_to :mediable, polymorphic: true

  enum medium_type: [:photo, :video]

  before_destroy :destory_upload_image

  def destory_upload_image
    bucket = 'dogadopt' # 要上传的空间
    photo_name = self.url.split('/').last
    put_policy = Qiniu::Auth::PutPolicy.new(
      bucket, # 存储空间
      photo_name,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
      3600    # token 过期时间，默认为 3600 秒，即 1 小时
    )
    uptoken = Qiniu::Auth.generate_uptoken(put_policy) # 生成上传 Token
    #删除资源
    code, result, response_headers = Qiniu::Storage.delete(
      bucket,     # 存储空间
      photo_name  # 资源名
    )
  end
end
