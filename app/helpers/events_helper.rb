module EventsHelper
  def formatted_title(event)
    [h(event.title),"&mdash;", event.start_time.to_formatted_s(:long_ordinal)].join(" ").html_safe
  end
end
