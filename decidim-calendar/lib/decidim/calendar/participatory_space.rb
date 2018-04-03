# frozen_string_literal: true

Decidim.register_participatory_space(:calendar) do |participatory_space|
  participatory_space.context(:public) do |context|
    context.engine = Decidim::Calendar::Engine
  end

  participatory_space.context(:admin) do |context|
    context.engine = Decidim::Calendar::AdminEngine
  end
end
