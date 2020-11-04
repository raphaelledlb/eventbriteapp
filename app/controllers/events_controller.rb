class EventsController < ApplicationController
  def index
    Event.all
  end

  def new
    Event.create
  end
end
