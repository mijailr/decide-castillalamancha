# frozen_string_literal: true

require 'rails'
require 'active_support/all'

require 'decidim/core'

module Decidim
  module Calendar
    # Decidim's Members Rails Admin Engine.
    # There is nothing to administer, it's 'only provided since Decidim
    # requires it.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Calendar

      routes do
      end
    end
  end
end
