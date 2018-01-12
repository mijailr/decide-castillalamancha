# frozen_string_literal: true

module Decidim
  module News
    # The main application controller that inherits from Rails.
    class ApplicationController <  Decidim::ApplicationController
      protect_from_forgery with: :exception, prepend: true
    end
  end
end
