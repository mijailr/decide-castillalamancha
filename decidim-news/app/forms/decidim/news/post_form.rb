# frozen_string_literal: true

module Decidim
  module News
    # A form object to create or update pages.
    class PostForm < Form
      include TranslatableAttributes

      attribute :slug, String
      translatable_attribute :title, String
      translatable_attribute :content, String

      mimic :post

      validates :slug, presence: true
      validates :title, :content, translatable_presence: true
      validates :slug, format: { with: /\A[a-z0-9-]+/ }

      validate :slug, :slug_uniqueness

      alias organization current_organization

      def slug
        super.to_s.downcase
      end

      private

      def slug_uniqueness
        return unless organization
        return unless organization.posts.where(slug: slug).where.not(id: id).any?

        errors.add(:slug, :taken)
      end
    end
  end
end
