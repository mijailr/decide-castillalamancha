# frozen_string_literal: true

module Decidim
  module News
    module Admin
      class Permissions < Decidim::DefaultPermissions
        def permissions
          return permission_action unless user
          return permission_action unless permission_action.scope == :admin

          unless user.admin?
            disallow!
            return permission_action
          end

          user_can_enter_space_area?

          if read_admin_dashboard_action?
            allow!
            return permission_action
          end
          byebug

          allowed_read_participatory_space?
          allowed_post_action?

          permission_action
        end

        private

        def post
          @post ||= context.fetch(:post, nil)
        end

        def allowed_post_action
          return unless permission_action.subject == :post

          case permission_action.action
          when :create, :read
            allow!
          when :update, :destroy
            toggle_allow(post.present?)
          end
        end

        def allowed_read_participatory_space?
          return unless permission_action.action == :enter &&
                        permission_action.subject == :space_area &&
                        context.fetch(:space_name, nil) == :news

          allow!
        end

        def read_admin_dashboard_action?
          permission_action.action == :read &&
            permission_action.subject == :admin_dashboard
        end
      end
    end
  end
end
