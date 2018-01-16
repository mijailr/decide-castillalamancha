# frozen_string_literal: true

Decidim.register_participatory_space(:calendar) do |participatory_space|
  participatory_space.engine = Decidim::Calendar::Engine
  participatory_space.admin_engine = Decidim::Calendar::AdminEngine
  participatory_space.icon = 'decidim/calendar/icon.svg'
end
