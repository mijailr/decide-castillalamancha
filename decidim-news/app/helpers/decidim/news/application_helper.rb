
# frozen_string_literal: true

module Decidim
  module News
    # Custom helpers, scoped to the blogs engine.
    #
    module ApplicationHelper
      include PaginateHelper
      include Decidim::News::PostHelper
      include Decidim::ApplicationHelper
      include Decidim::Comments::CommentsHelper
      include Decidim::SanitizeHelper
    end
  end
end
