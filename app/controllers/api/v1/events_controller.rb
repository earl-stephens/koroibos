module Api
  module V1
    class EventsController < ApplicationController

      def index
        render json: EventSerializer.new.serialize
      end

    end
  end
end
