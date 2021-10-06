# frozen_string_literal: true

module Api
  module V1
    # Team endpoints controller
    class TeamsController < ApplicationController
      def index
        teams = Team.all
        render json: { data: teams }
      end

      def show
        team = Team.where(id: team_params[:id])
                   .select(:id, :name, :rating)
        sec = team.first.rating

        # Below is the expensive processing that needs to be off-loaded to a job worker.
        # p "Hey #{team.first.name}, going to sleep for #{sec} secs."
        # sleep(sec)
        # p "It was quite a long nap."

        BuyTimeWorker.perform_async(team.first.name, sec)

        render json: { data: team }
      end

      private

      def team_params
        params.permit(:id)
      end
    end
  end
end
