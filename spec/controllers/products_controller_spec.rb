require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it 'renders the index action successfully' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
