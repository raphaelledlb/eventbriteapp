class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new("start_date" => params[:start_date],
                              "duration" => params[:duration],
                              "title" => params[:title],
                              "description" => params[:description],
                              "location" => params[:location],
                              "price" => params[:price],
                              "organizer_id" => current_user.id)

      if @event.save
        redirect_to 'root_path'

      else
        render 'new'
  end

  def show
    @event = current_event
  end

end

private

  def current_event
    Event.find(params[:id])
  end
end
