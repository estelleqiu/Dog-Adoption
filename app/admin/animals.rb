ActiveAdmin.register Animal do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :name, :animal_type, :birth_date, :gender, :variety, :character, :slug, :photo_url, :description
  form partial: 'form'
  # config.clear_action_items!
  index do
    selectable_column
    column :id
    column :name
    column :animal_type
    column :birth_date
    column :gender
    column :variety
    column :character
    column :slug
    column :description
    column(:photo_url) do |animal|
      image_tag(animal.photo_url, class: 'dog-image') if animal.photo_url
    end
    actions
  end

  controller do
    def update
      bucket = 'dogadopt' # 要上传的空间
      key = params[:animal][:file].original_filename # 上传到七牛后保存的文件名
      qiniu_domain = 'http://p4wgbyuaw.bkt.clouddn.com/' # 外链默认域名
      put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
        3600    # token 过期时间，默认为 3600 秒，即 1 小时
      )
      uptoken = Qiniu::Auth.generate_uptoken(put_policy) # 生成上传 Token

      filePath = File.absolute_path(params[:animal][:file].tempfile) # 要上传文件的本地路径

      code, result, response_headers = Qiniu::Storage.upload_with_token_2(
        uptoken,
        filePath,
        key,
        nil, # 可以接受一个 Hash 作为自定义变量，请参照 http://developer.qiniu.com/article/kodo/kodo-developer/up/ vars.html#xvar
        bucket: bucket
      )

      params[:animal][:photo_url] = qiniu_domain + result['key'] # 将上传到七牛云的图片外链更新到photo_url字段

      super do |success, failure|
        success.html { redirect_to "#{collection_path}?#{request.env['HTTP_REFERER'].split('?')[1] || ''}" }
        failure.html { redirect_to action: :update }
      end
    end
  end
end
