# frozen_string_literal: true

module Decidim
  module News
    # News Post for organization
    class Post < ApplicationRecord
      include Decidim::Resourceable
      include Decidim::Comments::Commentable
      
      belongs_to :organization,
                  foreign_key: "decidim_organization_id",
                  class_name: "Decidim::Organization",
                  inverse_of: :posts
      validates :slug, presence: true, uniqueness: { scope: :organization }
      validates :slug, format: { with: /\A[a-z0-9-]+/ }

      def to_param
        slug
      end
    end
  end
end
