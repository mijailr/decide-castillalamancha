# frozen_string_literal: true

module Decidim
  module Calendar
    # Custom helpers, scoped to the meetings engine.
    #
    module ApplicationHelper
      include Decidim::Calendar::CalendarHelper
    end
  end
end
