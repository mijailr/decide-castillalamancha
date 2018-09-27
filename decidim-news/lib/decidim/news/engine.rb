# frozen_string_literal: true

require 'rails'
require 'active_support/all'

require 'decidim/core'
module Decidim
  module News
    # Public engine for decidim-news
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::News

      routes do
        resources :posts, only: %i[index show]
      end

      initializer "decidim_news.menu" do
        Decidim.menu :menu do |menu|
          menu.item I18n.t("posts.menu", scope: "decidim.news"),
                    decidim_news.posts_path,
                    icon_name: "news",
                    position: 2,
                    active: :inclusive
        end
      end

      # initializer "decidim_news.inject_abilities_to_user" do |_app|
      #   Decidim.configure do |config|
      #     config.abilities += [
      #       "Decidim::News::Abilities::EveryoneAbility",
      #     ]
      #   end
      # end
    end
  end
end
