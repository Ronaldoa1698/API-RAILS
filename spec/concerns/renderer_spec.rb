
require 'rails_helper'

RSpec.describe Renderer, type: :controller do
  controller(ApplicationController) do
    include Renderer

    def show
      user = User.find(params[:id])
      render_object(user)
    end
  end

  describe 'GET show' do
    let(:resource) { create(:dummy, name: 'sample') }

    it 'renders resource with render_object method' do
      get :show, params: { id: resource.id }

      data_fields = { 'id' => resource.id, 'name' => resource.name }

      expect(response.status).to eq(200)
      expect(load_body_data(response)).to include(data_fields)
    end
  end

  describe 'POST create' do
    it 'renders resource errors with render_errors method' do
      post :create, params: { user: { email: nil, password: nil } }

      error_fields = {
        'email' => ['can\'t be blank'],
        'password' => ['can\'t be blank']
      }

      expect(response.status).to eq(422)
      expect(load_body(response)).to eq(error_fields)
    end
  end
end