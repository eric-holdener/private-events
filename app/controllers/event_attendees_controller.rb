class EventAttendeesController < ApplicationController
  before_action :authenticate_user!
  # POST /event_attendees or /event_attendees.json
  def show
    @user = current_user
  end

  def create
    @event = Event.find(params[:event_id])
    @event_attendee = EventAttendee.new(attendee: current_user, attended_event: @event)

    respond_to do |format|
      if @event_attendee.save
        format.html { redirect_to @event, notice: "You have RSVP'd for this event" }
        format.json { render :show, status: :created, location: @event_attendee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_attendees/1 or /event_attendees/1.json
  def update
    respond_to do |format|
      if @event_attendee.update(event_attendee_params)
        format.html { redirect_to event_attendee_url(@event_attendee), notice: "Your RSVP has been updated" }
        format.json { render :show, status: :ok, location: @event_attendee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_attendees/1 or /event_attendees/1.json
  def destroy
    @event_attendee.destroy

    respond_to do |format|
      format.html { redirect_to event_attendees_url, notice: "Event attendee was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
