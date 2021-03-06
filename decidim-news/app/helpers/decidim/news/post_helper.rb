# frozen_string_literal: true

module Decidim
  module News
    # Custom helpers used in blogs views
    module PostHelper
      include Decidim::ApplicationHelper
      include Decidim::TranslationsHelper
      include Decidim::ResourceHelper
      include Decidim::PaginateHelper
      # Public: truncates the blog body
      #
      # blog - a Decidim::Blog instance
      # max_length - a number to limit the length of the body
      #
      # Returns the blog's body truncated.
      def post_description(post, max_length = 180)
        body = strip_tags(translated_attribute(post.content))
        CGI.unescapeHTML html_truncate(body, max_length: max_length)
      end
    end
  end
end
