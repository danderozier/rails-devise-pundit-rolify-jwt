# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :request_id, :user_agent, :ip_address

  # resets { Time.zone = nil }

  def current_user=(user)
    super
    self.current_user = user
    # Time.zone    = user.time_zone
  end
end
