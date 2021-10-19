class ApplicationController < ActionController::Base
  before_action :get_footer_info

  def get_footer_info
    @categories_all = Category.where.not(slug:"p")
  end
end
