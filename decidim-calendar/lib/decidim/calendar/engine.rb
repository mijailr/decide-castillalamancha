# frozen_string_literal: true

require 'rails'
require 'active_support/all'

require 'decidim/core'
module Decidim
  module Calendar
    # This is the engine that runs on the public interface of `decidim-calendar`
    # It mostly handles rendering the calendar.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Calendar

      routes do
        resources :calendar, only: %i[index show]
      end

      initializer 'decidim_calendar.inject_abilities_to_user' do |_app|
        Decidim.configure do |config|
          config.abilities << 'Decidim::Abilities::EveryoneAbility'
        end
      end

      initializer 'decidim_calendar.menu' do
        Decidim.menu :menu do |menu|
          menu.item I18n.t('menu.calendar', scope: 'decidim'),
                    decidim_calendar.calendar_index_path,
                    position: 2,
                    active: :inclusive
        end
      end
      initializer 'decidim_calendar.assets' do |app|
        app.config.assets.precompile += %w[decidim_calendar_manifest.js decidim_calendar_manifest.css]
      end
    end
  end
end
