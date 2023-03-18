require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "POST /api/v1/users" do

    let(:user_params) do
      {emai: 'user@duetcode.io', password: 'samplepassword'}
    end

    it 'creates a new user' do
      post api_v1_users_path, params: {user: user_params}
      expect_body = {'email' => 'user@duetcode.io'}

      expect(response).to have_http_status(:created)
      expect(load_body(response.body)).to include(expect_body)
    end

    it 'returns unprocessable_entity status' do
      user_params[:password] = nil
      post api_v1_users_path, params: {user: user_params}
      expect_error = {'password' => ["can't be blank"]}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(load_body(response.body)).to eq(expect_error)
    end
  end
end

