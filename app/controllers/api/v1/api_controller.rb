# frozen_string_literal: true

class Api::V1::ApiController < ActionController::API
  include Authentication
  include SetCurrentRequestDetails
  include Pundit

  respond_to :json

  rescue_from ActiveRecord::RecordInvalid,
              with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound,
              with: :render_not_found_response
  rescue_from JSON::ParserError,
              with: :render_bad_request_response
  rescue_from Pundit::NotAuthorizedError,
              with: :render_not_authorized_response

  before_action do
    self.namespace_for_serializer = Api::V1
  end

  protected

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors },
           status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { error: exception.message },
           status: :not_found
  end

  def render_bad_request_response(exception)
    render json: { error: exception.message },
           status: :bad_request
  end

  def render_not_authorized_response(exception)
    render json: { error: exception.message },
           status: :forbidden
  end
end
