# frozen_string_literal: true
Decidim::Category.class_eval do
  def self.default_scope
    order(:id)
  end
end
