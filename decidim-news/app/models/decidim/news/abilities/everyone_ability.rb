# frozen_string_literal: true

module Decidim
  module News
    module Abilities
      # Defines the base abilities related to news posts for any
      # user. Guest users will use these too. Intended to be used with
      # `cancancan`.
      class EveryoneAbility < Decidim::Abilities::EveryoneAbility
        def initialize(user, context)
          super(user, context)

          can :read, Post
          can :read, :public_pages
        end
      end
    end
  end
end
