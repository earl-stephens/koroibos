module Api
  module V1
    class AthletesController < ApplicationController

      def index
        render json: AthleteSerializer.new(Athlete.all)
      end

    end
  end
end
