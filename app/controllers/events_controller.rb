class EventsController < ApplicationController
    before_action :user_signed_in?

    def index
      #@events = Events.all
    end

    def show
      @event = Event.find(params[:id])
    end

    def new
      @event = current_user.events.new
    end

    def create
      @event = current_user.events.create(event_params)
      if @event.errors.any?
        redirect_to new_event_path, danger: "Une erreur est survenue, réessayer de créer un évenement ✘"
      else
        redirect_to events_path, success: "Ton évenement a été créé avec succès ✔ "
      end
    end

    def edit
      @event = current_user.events.find(params[:id])
    end

    def update
      @event = current_user.events.find(params[:id])
      if @event.update_attributes(event_params)
        redirect_to @event, success: "Ton évenement a été modifié avec succès ✔ "
      else
        render 'edit'
      end
    end

    def destroy
      @event = Events.find(params[:id])
      @event.delete
      redirect_to root_path, success: "Ton évenement a été supprimé avec succès ✔ "
    end
#=======================================================================================================================
    private

    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end
end
