class ApplicationController < ActionController::Base
  class NotAuthorizedError < StandardError
  end

  rescue_from NotAuthorizedError do |exception|
    redirect_to dashboard_path, alert: "You are not authorized to access this page."
  end

  def user_is_member_or_better?(user, league)
    user.has_role?(:member, league) || user.has_role?(:owner, league)
  end

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end
end
