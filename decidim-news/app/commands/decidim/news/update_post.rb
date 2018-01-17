# frozen_string_literal: true

module Decidim
  module News
    # A command with all the business logic when updating a post.
    class UpdatePost < Rectify::Command
      # Public: Initializes the command.
      #
      # post - The Post to update
      # form - A form object with the params.
      def initialize(post, form)
        @post = post
        @form = form
      end

      # Executes the command. Broadcasts these events:
      #
      # - :ok when everything is valid.
      # - :invalid if the form wasn't valid and we couldn't proceed.
      #
      # Returns nothing.
      def call
        return broadcast(:invalid) if form.invalid?

        update_post
        broadcast(:ok)
      end

      private

      attr_reader :form

      def update_post
        @post.update_attributes!(attributes)
      end

      def attributes
        {
          title: form.title,
          slug: form.slug,
          content: form.content
        }
      end
    end
  end
end
