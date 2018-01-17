# frozen_string_literal: true

Decidim.register_participatory_space(:news) do |participatory_space|
  participatory_space.engine = Decidim::News::Engine
  participatory_space.admin_engine = Decidim::News::AdminEngine
  participatory_space.icon = 'decidim/news/icon.svg'
end
