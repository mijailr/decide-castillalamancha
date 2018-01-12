# frozen_string_literal: true

require_dependency "decidim/news/application_controller"

module Decidim
  module News
    class PostsController < Decidim::News::ApplicationController
      skip_authorization_check
      helper_method :posts, :post

      def index
        @posts = posts
      end

      def show
        @post = post
      end

      private

      def post
        @post ||= posts.find_by(slug: params[:id])
      end

      def posts
        @posts ||= current_organization.posts.page(params[:page]).per(9)
      end
    end
  end
end
