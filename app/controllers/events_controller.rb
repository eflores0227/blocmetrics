class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @event}
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.all

    @events = @event.events.group_by(&:name)
  end

  def update
  respond_to do |format|
    if @event.update(recipe_params)
      format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      format.json { render :show, status: :ok, location: @recipe }
    else
      format.html { render :edit }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
    @event.destroy
  end
end
