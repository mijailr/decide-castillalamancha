module Decidim
  class Organization < ApplicationRecord
    has_many :posts, foreign_key: "decidim_organization_id", class_name: "Decidim::News::Post", inverse_of: :organization, dependent: :destroy
  end
end
