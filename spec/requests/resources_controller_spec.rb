require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'GET /api/v1/resources', type: :request do
  let(:user) { Fabricate(:user) }
  let(:url) { '/api/v1/resources' }
  let(:headers) do
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

  context 'when user has permissions' do
    before do
      get url, headers: auth_headers
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    # it 'returns JTW token in authorization header' do
    #   expect(response.headers['Authorization']).to be_present
    # end

  end

  context 'when user does not have permissions' do
    before do
      get url, headers: headers
    end

    it 'returns unathorized status' do
      # puts response.inspect
      # expect(response).to have_http_status(302)
      # follow_redirect!
      expect(response).to have_http_status(401)
    end
  end
end
