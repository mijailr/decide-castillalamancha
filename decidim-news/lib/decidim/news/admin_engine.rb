# frozen_string_literal: true

require 'rails'
require 'active_support/all'

require 'decidim/core'

module Decidim
  module News

    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::News::Admin

      routes do
        resources :posts
      end

      initializer "decidim_news.admin_menu" do
        Decidim.menu :admin_menu do |menu|
          menu.item I18n.t("admin.menu", scope: "decidim.news"),
                    Decidim::News::AdminEngine.routes.url_helpers.posts_path,
                    icon_name: "clipboard",
                    position: 5,
                    active: :inclusive,
                    if: can?(:manage, Decidim::News::Post)
        end
      end

      initializer "decidim_news.inject_abilities_to_user" do |_app|
        Decidim.configure do |config|
          config.admin_abilities += [
            "Decidim::News::Abilities::AdminAbility",
          ]
        end
      end

    end
  end
end
