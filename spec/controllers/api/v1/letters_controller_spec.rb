require 'rails_helper'

RSpec.describe Api::V1::LettersController, type: :controller do
  describe 'GET index' do
    before(:example) {get :index}

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns array of 16 letters' do
      expect(json[:data].length).to eq(16)
    end

    it 'has keys' do
      expect(json.keys).to contain_exactly(:data, :status)
    end
  end
end
