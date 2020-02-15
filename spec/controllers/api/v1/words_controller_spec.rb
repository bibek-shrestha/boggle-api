require 'rails_helper'

RSpec.describe Api::V1::WordsController, type: :controller do
  describe 'GET index' do
    it 'returns valid' do
      get(:index, params: {:word => 'HUNTER'})
      expect(json).to eq(:data => {isValid: true}, :status => 'ok')
    end

    it 'returns invalid' do
      get(:index, params: {:word => 'HSDFAL'})
      expect(json).to eq(:data => {isValid: false}, :status => 'ok')
    end
  end
end
