# frozen_string_literal: true

require_dependency "decidim/news/application_controller"

module Decidim
  module News
    class PostsController < Decidim::News::ApplicationController
      helper_method :posts, :post
      authorize_resource :public_pages, class: false
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
        @posts ||= Post.where(organization: current_organization).page(params[:page]).per(9)
      end
    end
  end
end
