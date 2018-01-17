# frozen_string_literal: true

module Decidim
  module News
    # News Post for organization
    class Post < ApplicationRecord
      include Decidim::Resourceable
      include Decidim::Comments::Commentable
      before_create :create_slug
      has_many :comments, as: :decidim_commentable, class_name: "Decidim::Comments::Comment"
      belongs_to :organization,
                  foreign_key: "decidim_organization_id",
                  class_name: "Decidim::Organization",
                  inverse_of: :posts
      validates :slug, presence: true, uniqueness: { scope: :organization }
      validates :slug, format: { with: /\A[a-z0-9-]+/ }
      default_scope { order(created_at: :desc) }

      def to_param
        slug.parameterize
      end

      private
      def create_slug
        self.slug = slug.parameterize
      end
    end
  end
end
