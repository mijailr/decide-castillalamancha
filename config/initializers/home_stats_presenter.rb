# frozen_string_literal: true
Decidim::HomeStatsPresenter.class_eval do
  def highlighted
    highlighted_stats = Decidim.stats.only([:users_count, :processes_count]).with_context(organization).map { |name, data| [name, data] }
    highlighted_stats = highlighted_stats.concat(global_stats(priority: Decidim::StatsRegistry::HIGH_PRIORITY))
    highlighted_stats = highlighted_stats.concat(feature_stats(priority: Decidim::StatsRegistry::HIGH_PRIORITY))
    highlighted_stats = highlighted_stats.reject(&:empty?)
    highlighted_stats = highlighted_stats.reject { |_name, data| data.zero? }
    meeting_attendees = Decidim::Meetings::Meeting.sum(:attendees_count)
    attendees = [[:users_count, meeting_attendees]]
    highlighted_stats = (highlighted_stats + attendees).group_by(&:first).map { |k,v| [k, v.map(&:last).inject(:+)] }
    safe_join(
      highlighted_stats.in_groups_of(2, false).map do |stats|
        content_tag :div, class: "home-pam__highlight" do
          safe_join(
            stats.map do |name, data|
              render_stats_data(name, data)
            end
          )
        end
      end
    )
  end
end
