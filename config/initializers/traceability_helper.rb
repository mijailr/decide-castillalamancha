# frozen_string_literal: true

Decidim::TraceabilityHelper.module_eval do
  # Requested to delete html tags from diff
  def render_diff_data(data)
    content_tag(:div, class: "card card--list diff diff-#{data[:type]}") do
      if %i[i18n i18n_html].include?(data[:type])
        render_diff_value(
          '&nbsp;',
          data[:type],
          nil,
          data: {
            old_value: data[:old_value].to_s
              .gsub('</p>', "\n")
              .gsub(/<\/?[^>]*>/, ""),
            new_value: data[:new_value].to_s
              .gsub('</p>', "\n")
              .gsub(/<\/?[^>]*>/, "")
          }
        )
      else
        render_diff_value(data[:old_value], data[:type], :removal) +
          render_diff_value(data[:new_value], data[:type], :addition)
      end
    end
  end
end
