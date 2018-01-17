# frozen_string_literal: true

module Decidim
  module News
    # Default ApplicationRecord
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
