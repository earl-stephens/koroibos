module Api
  module V1
    class AthletesController < ApplicationController

      def index
        if params[:age] == nil
          render json: athlete_output(nil)
        elsif params[:age] == 'youngest'
          render json: athlete_output(params[:age])
        end
      end

      private

      def athlete_output(age_restriction)
        if age_restriction == nil
          olympian_hash = Hash.new
          olympian_hash["olympians"] = Athlete.all.map do |person|
            AthleteSerializer.new(person).serialize
          end
          olympian_hash
        elsif age_restriction == 'youngest'
          [AthleteSerializer.new(Athlete.get_youngest).serialize]
        end
      end
      
    end
  end
end
