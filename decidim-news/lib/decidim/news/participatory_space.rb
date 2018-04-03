# frozen_string_literal: true

Decidim.register_participatory_space(:news) do |participatory_space|
  participatory_space.context(:public) do |context|
    context.engine = Decidim::News::Engine
  end

  participatory_space.context(:admin) do |context|
    context.engine = Decidim::News::AdminEngine
  end
end
