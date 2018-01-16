# frozen_string_literal: true

module Decidim
  module News
    class Admin::PostsController < Decidim::Admin::ApplicationController
      skip_authorization_check
      def index
        authorize! :index, Post
        @posts = collection
      end

      def new
        authorize! :new, Post
        @form = form(PostForm).instance
      end

      def create
        authorize! :new, Post
        @form = form(PostForm).from_params(form_params)

        CreatePost.call(@form) do
          on(:ok) do
            flash[:notice] = I18n.t("create.success", scope: "decidim.news")
            redirect_to posts_path
          end

          on(:invalid) do
            flash.now[:alert] = I18n.t("create.error", scope: "decidim.news")
            render :new
          end
        end
      end

      def edit
        authorize! :update, post
        @form = form(PostForm).from_model(post)
      end

      def update
        @post = collection.find(params[:id])
        authorize! :update, post
        @form = form(PostForm).from_params(form_params)

        UpdatePost.call(post, @form) do
          on(:ok) do
            flash[:notice] = I18n.t("posts.update.success", scope: "decidim.news")
            redirect_to posts_path
          end

          on(:invalid) do
            flash.now[:alert] = I18n.t("posts.update.error", scope: "decidim.news")
            render :edit
          end
        end
      end

      private

      def form_params
        form_params = params.to_unsafe_hash
        form_params["post"] ||= {}
        form_params["post"]["organization"] = current_organization

        return form_params unless post

        form_params["post"]["slug"] ||= post.slug
        form_params
      end

      def post
        @post ||= collection.find_by(slug: params[:id])
      end

      def collection
        current_organization.posts
      end


    end
  end
end
