# frozen_string_literal: true

module Decidim
  module Calendar
    # Custom helper to generate json
    module CalendarHelper
      include Decidim::ApplicationHelper
      include Decidim::TranslationsHelper
      include Decidim::ResourceHelper
      def calendar_events(meeting)
        "{
        title: '#{translated_attribute meeting.title}',
        start: '#{meeting.start_time.strftime('%FT%R')}',
        end: '#{meeting.end_time.strftime('%FT%R')}',
        url: '#{url_for decidim_participatory_process_meetings.meeting_path(meeting, feature_id: meeting.feature.id, participatory_process_slug: meeting.feature.participatory_space.slug )}'
        },"
      end
    end
  end
end
