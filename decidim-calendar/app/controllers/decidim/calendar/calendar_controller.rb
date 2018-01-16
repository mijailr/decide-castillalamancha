# frozen_string_literal: true

module Decidim
  module Calendar
    # Exposes the debate resource so users can view them
    class CalendarController < Decidim::Calendar::ApplicationController
      helper Decidim::ApplicationHelper
      skip_authorization_check only: %i[index show]
      include FilterResource

      def index
        @meetings = Decidim::Meetings::Meeting.all
      end

      def show
        'hola'
      end
    end
  end
end
