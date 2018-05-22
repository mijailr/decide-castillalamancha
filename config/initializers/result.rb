# frozen_string_literal: true

Decidim::Accountability::Result.class_eval do
  def self.default_scope
    order(:id)
  end
end
