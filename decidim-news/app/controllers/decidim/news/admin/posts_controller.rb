# frozen_string_literal: true

module Decidim
  module News
    class Admin::PostsController < Decidim::Admin::ApplicationController

      helper_method :posts, :post
      def index
        authorize! :index, Post
        @posts = collection.page(params[:page]).per(15)
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
            flash[:notice] = I18n.t("admin.create.success", scope: "decidim.news")
            redirect_to posts_path
          end

          on(:invalid) do
            flash.now[:alert] = I18n.t("admin.create.error", scope: "decidim.news")
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
            flash[:notice] = I18n.t("update.success", scope: "decidim.news")
            redirect_to posts_path
          end

          on(:invalid) do
            flash.now[:alert] = I18n.t("update.error", scope: "decidim.news")
            render :edit
          end
        end
      end
      def destroy
        authorize! :destroy, post
        post.destroy!

        flash[:notice] = I18n.t("destroy.success", scope: "decidim.news")

        redirect_to posts_path
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
        Post.where(organization: current_organization)
      end


    end
  end
end
