# frozen_string_literal: true

module Decidim
  module News
    # A command with all the business logic when creating a static page.
    class CreatePost < Rectify::Command
      # Public: Initializes the command.
      #
      # form - A form object with the params.
      def initialize(form)
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

        create_post
        broadcast(:ok)
      end

      private

      attr_reader :form

      def create_post
        Post.create!(
          title: form.title,
          slug: form.slug,
          content: form.content,
          organization: current_organization,
          user: current_user
        )
      end
    end
  end
end
