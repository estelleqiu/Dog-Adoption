module ApplicationHelper
  private
  def uptoken

    put_policy = Qiniu::Auth::PutPolicy.new(
      "dogadopt",                    # 存储空间
      nil,                           # 最终资源名，可省略，即缺省为“创建”语义
      1800,                          # 相对有效期，可省略，缺省为3600秒后 uptoken 过期
      (Time.now + 30.minutes).to_i  # 绝对有效期，可省略，指明 uptoken 过期期限（绝对值），通常用于调试，这里表示半小时
    )

    uptoken = Qiniu::Auth.generate_uptoken(put_policy) #生成凭证

  end
end
