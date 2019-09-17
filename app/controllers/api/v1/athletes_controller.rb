module Api
  module V1
    class AthletesController < ApplicationController

      def index
        render json: athlete_output
      end

      private

      def athlete_output
        olympian_hash = Hash.new
        olympian_hash["olympians"] = Athlete.all.map do |person|
          AthleteSerializer.new(person).serialize
        end
        olympian_hash
      end

    end
  end
end
