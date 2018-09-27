# frozen_string_literal: true

Decidim::Organization.class_eval do
  has_many :posts, class_name: "Decidim::News::Post", foreign_key: "decidim_organization_id"
end
