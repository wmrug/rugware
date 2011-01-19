class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  
  before_filter :get_next_event
  
  def get_next_event
    @next_event = Event.upcoming.first
  end
  
  def has_banner 
    @banner = true
  end
  
end
