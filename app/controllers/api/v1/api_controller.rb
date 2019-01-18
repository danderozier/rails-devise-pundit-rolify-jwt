class Api::V1::ApiController < ActionController::API
  include Pundit

  respond_to :json

  # Pundit
  protect_from_forgery

  rescue_from ActiveRecord::RecordInvalid,
              :with => :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound,
              :with => :render_not_found_response
  rescue_from JSON::ParserError,
              :with => :render_bad_request_response

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

end
