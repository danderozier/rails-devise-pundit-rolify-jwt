class JwtFailureApp < Devise::FailureApp

  def respond
    return super unless request.format == :json
    json_failure
  end

  def json_failure
    self.status = 401
    self.content_type = 'application/json'
    self.response_body = {
      success: false,
      message: i18n_message
    }.to_json
  end
end
