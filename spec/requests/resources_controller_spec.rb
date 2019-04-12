require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe 'GET /api/v1/resources', type: :request do
  let(:user) { Fabricate(:user) }
  let(:admin_user) { Fabricate(:admin_user) }
  let(:url) { '/api/v1/resources' }
  let(:headers) do
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }
  let(:admin_auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, admin_user) }

  context 'when admin user is logged in' do
    before do
      get url, headers: admin_auth_headers
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'when normal user is logged in' do
    before do
      get url, headers: auth_headers
    end

    it 'returns 403 forbidden' do
      expect(response).to have_http_status(403)
    end
  end

  context 'when user is not logged in' do
    before do
      get url, headers: headers
    end

    it 'returns 401 unauthorized' do
      expect(response).to have_http_status(401)
    end
  end
end

RSpec.describe 'GET /api/v1/resources/1', type: :request do
  let(:user) { Fabricate(:user) }
  let(:admin_user) { Fabricate(:admin_user) }
  let(:resource) { Fabricate(:resource) }
  let(:url) { "/api/v1/resources/#{resource.id}" }
  let(:headers) do
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }
  let(:admin_auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, admin_user) }

  context 'when admin user is logged in' do
    before do
      get url, headers: admin_auth_headers
    end

    it 'returns 200 success' do
      expect(response).to have_http_status(200)
    end
  end

  context 'when normal user is logged in' do
    before do
      get url, headers: auth_headers
    end

    it 'returns 200 success' do
      expect(response).to have_http_status(200)
    end
  end

  context 'when user is not logged in' do
    before do
      get url, headers: headers
    end

    it 'returns 401 unauthorized' do
      expect(response).to have_http_status(401)
    end
  end
end
