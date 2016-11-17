require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    before do
      get :index
    end

    it { is_expected.to respond_with 200 }
  end

  describe '#show' do
    context 'with product id' do
      before do
        # stub external call to semantics
        allow_any_instance_of(SemanticsService).to receive(:search) { {} }
        get :show, params: { id: 'iphone' }
      end

      it { is_expected.to respond_with 200 }
    end
  end

  describe '#search' do
    it 'redirects to product page with search term' do
      get :search, params: { term: 'iphone' }
      expect(response).to redirect_to(product_path(id: 'iphone'))
    end
  end
end
