class HomeController < ApplicationController
  before_filter :has_banner
  
  def index
    @past_events     = Event.past[0..2]
    @upcoming_events = Event.upcoming[0..2]
  end
end
