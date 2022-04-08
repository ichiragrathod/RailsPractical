class EventsController < ApplicationController
    
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    
    #Searching Orders Record by Status
    if params[:search]
      @events = Event.where('category_id=?',params[:search])
    else
      @events = Event.order("event_date desc")
    end
  end

  def show
   
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.users << current_user
    if @event.save
      flash[:notice] = "Event details was created successfully."
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event details updated successfully."
      redirect_to @event
    else
        render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :category_id, :event_date)
  end
end
