# frozen_string_literal: true

module Ownable
  extend ActiveSupport::Concern

  included do
    belongs_to :user, optional: true, default: -> { Current.user }

    # A slightly more elegant way to check if an object is owned by a User.
    #
    def owned?
      user.present?
    end
  end
end
