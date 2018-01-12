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
          menu.item I18n.t("menu.news", scope: "decidim.admin"),
                    Decidim::News::AdminEngine.routes.url_helpers.posts_path,
                    icon_name: "clipboard",
                    position: 5,
                    active: :inclusive
        end
      end


    end
  end
end
