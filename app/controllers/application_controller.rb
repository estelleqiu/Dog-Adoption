class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    render file: '/public/404.html', status: 404, layout: false, content_type: 'text/html'
  end
end
