module EventsHelper
  def event_on_formatted
    event_on.strftime("%B %d, %Y at: %r")
  end
end
