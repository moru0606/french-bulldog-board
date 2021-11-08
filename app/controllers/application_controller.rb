class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend

  private

  def require_user_logged_in?
    redirect_to login_url unless logged_in?
  end
end
