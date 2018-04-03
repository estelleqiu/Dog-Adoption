# == Schema Information
#
# Table name: animals
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  animal_type        :integer          default("dog")
#  birth_date         :date
#  gender             :integer
#  variety            :string
#  character          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string
#  description        :text
#  is_vaccined        :boolean          default(FALSE)
#  is_sterilizationed :boolean          default(FALSE)
#  size               :string
#

class Animal < ApplicationRecord
  has_one :adoption
  has_one :person, through: :adoption
  has_many :media, as: :mediable

  enum animal_type: [:dog, :cat]
  enum gender: [:male, :female, :unknown]

  validates :name, presence: true
  validates :slug, uniqueness: true, presence: true

  accepts_nested_attributes_for :media, allow_destroy: true

  before_save :update_slug, :upload_image

  def update_slug
    self.slug = PinYin.permlink(name)
  end

  def upload_image
    binding.pry
    bucket = 'dogadopt' # 要上传的空间
    qiniu_domain = 'http://p4wgbyuaw.bkt.clouddn.com/' # 外链默认域名
    params[:animal][:file].each do |f|
      key = f.original_filename # 上传到七牛后保存的文件名

      put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
        3600    # token 过期时间，默认为 3600 秒，即 1 小时
      )
      uptoken = Qiniu::Auth.generate_uptoken(put_policy) # 生成上传 Token

      filePath = File.absolute_path(f.tempfile) # 要上传文件的本地路径

      code, result, response_headers = Qiniu::Storage.upload_with_token_2(
        uptoken,
        filePath,
        key,
        nil, # 可以接受一个 Hash 作为自定义变量，请参照 http://developer.qiniu.com/article/kodo/kodo-developer/up/ vars.html#xvar
        bucket: bucket
      )
      url = qiniu_domain + key
      Medium.create(mediable_type: 'Animal', url: url, mediable_id: animal.id, medium_type: 'photo') # 新建一条type为photo，url为七牛云的图片外链的数据
    end
    params[:animal][:media_attributes] = nil
  end
end
