# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainController, type: :controller do
  describe 'GET #index' do
    xit 'returns http success' do
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end
