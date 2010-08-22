class EventsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @events = Event.all
  end
  
  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to @event
    else
      flash.now[:error] = "Something went wrong"
      render :action => "new"
    end
  end
  
  def update
    if @event.update_attributes(params[:event])
      redirect_to @event
    else
      flash[:error] = "Could not save"
      render :action => "edit"
    end
  end
  
  def destroy
    @event.destroy
    redirect_to events_path
  end
  
end
