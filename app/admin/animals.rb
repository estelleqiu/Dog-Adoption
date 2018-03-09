ActiveAdmin.register Animal do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :name, :animal_type, :birth_date, :gender, :variety, :character, :slug, :description, :size, :file, media_attributes: [:id, :medium_type, :mediable_type, :mediable_id, :_destroy]
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
      animal = Animal.find_by(slug: params[:animal][:slug])
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
end
