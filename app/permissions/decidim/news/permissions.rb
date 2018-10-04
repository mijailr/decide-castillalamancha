# frozen_string_literal: true

module Decidim
  module News
    class Permissions < Decidim::DefaultPermissions

      def permissions
        allowed_public_anonymous_action?
        permission_action unless user
        allowed_public_action?
        permission_action unless permission_action.scope == :admin
        return Decidim::News::Admin::Permissions.new(user, permission_action, context).permissions if permission_action.scope == :admin
        permission_action
      end

      private

      def post
        @post ||= context.fetch(:post, nil)
      end

      def allowed_public_anonymous_action?
        return unless permission_action.action == :read
        return unless permission_action.scope == :public

        case permission_action.subject
        when :post_list
          allow!
        end
      end

      def allowed_public_action?
        return unless permission_action.scope == :public
        return unless permission_action.subject == :post
      end
    end
  end
end
