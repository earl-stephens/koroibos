module Api
  module V1
    class OlympianStatsController < ApplicationController

      def index
        render json: StatsSerializer.new.serialize
      end

    end
  end
end
