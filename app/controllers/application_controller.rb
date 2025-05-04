class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :user_signed_in?
  
  private
  
  def user_signed_in?
    # For now, return false since we haven't implemented user authentication yet
    false
  end
end