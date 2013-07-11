class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize  #вызов метода перед каждым действием в приложении

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Authorize please"
    end
  end
end
