# frozen_string_literal: true

Decidim.register_participatory_space(:news) do |participatory_space|
  participatory_space.model_class_name = "Decidim::News::Post"
  participatory_space.icon = "decidim/news/icon.svg"
  participatory_space.permissions_class_name = "Decidim::News::Permissions"

  participatory_space.participatory_spaces do |organization|
    Decidim::News::Post.where(organization: organization)
  end

  participatory_space.context(:public) do |context|
    context.engine = Decidim::News::Engine
  end

  participatory_space.context(:admin) do |context|
    context.engine = Decidim::News::AdminEngine
  end
end
