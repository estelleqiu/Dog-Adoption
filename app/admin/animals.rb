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
    column :actions do |animal|
      link = link_to 'View', admin_animal_path(animal, request.query_parameters).to_s, class: :member_link
      link += link_to 'Edit', edit_admin_animal_path(animal, request.query_parameters).to_s, class: :member_link
      link += link_to 'Live Page', animal_path(animal.slug), class: :member_link, target: "_blank"
      link
    end
  end

  controller do
    def update
      update_avatar_image if params[:animal][:file]
      super do |success, failure|
        success.html { redirect_to collection_path, request.query_parameters }
        failure.html { redirect_to action: :update }
      end
    end

    private

    def update_avatar_image
      bucket = 'dogadopt' # 要上传的空间
      key = params[:animal][:file].original_filename # 上传到七牛后保存的文件名
      photo_name = params[:animal][:photo_url].split('/').last #当前头像的资源名
      qiniu_domain = 'http://p4wgbyuaw.bkt.clouddn.com/' # 外链默认域名
      put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
        3600    # token 过期时间，默认为 3600 秒，即 1 小时
      )
      uptoken = Qiniu::Auth.generate_uptoken(put_policy) # 生成上传 Token

      filePath = File.absolute_path(params[:animal][:file].tempfile) # 要上传文件的本地路径

      if key != photo_name && key != 'default_avatar'
        #删除资源
        code, result, response_headers = Qiniu::Storage.delete(
          bucket,     # 存储空间
          photo_name  # 资源名
        )
      end

      code, result, response_headers = Qiniu::Storage.upload_with_token_2(
        uptoken,
        filePath,
        key,
        nil, # 可以接受一个 Hash 作为自定义变量，请参照 http://developer.qiniu.com/article/kodo/kodo-developer/up/ vars.html#xvar
        bucket: bucket
      )

      params[:animal][:photo_url] = qiniu_domain + result['key'] # 将上传到七牛云的图片外链更新到photo_url字段
    end
  end
end
