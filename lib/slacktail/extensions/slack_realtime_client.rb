class Slack::RealTime::Client
  def channels
    @channels ||= public_channels.merge(private_channels)
  end
end
