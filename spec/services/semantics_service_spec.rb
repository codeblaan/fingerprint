require 'rails_helper'

RSpec.describe SemanticsService do
  describe '#search' do
    context 'with product search resulsts cache' do
      it 'returns the cached results from a product search' do
        product = FactoryGirl.create(:iphone, :with_cache)
        service = SemanticsService.new(product)
        expect(service.search['results'][0]['model']).to eq('iphone 1')
      end
    end

    context 'without product search results cache' do
      it 'returns the results from a product search' do
        product = FactoryGirl.create(:iphone, :with_no_cache)
        service = SemanticsService.new(product)
        allow(service).to receive(:sem3) {
          double(
            products_field: double,
            get_products: {
              'code' => 'OK', 'results' => [{'model' => 'iphone 2'}]
            }
          )
        }
        expect(service.search['results'][0]['model']).to eq('iphone 2')
      end
    end
  end

  describe '#fetch_and_cache' do
    it 'caches the results of the response from semantics' do
      product = FactoryGirl.create(:iphone, :with_no_cache)
      expect(product.cache).to eql(nil)
      service = SemanticsService.new(product)
      allow(service).to receive(:sem3) {
        double(
          products_field: double,
          get_products: {
            'code' => 'OK', 'results' => [{'model' => 'iphone 2'}]
          }
        )
      }
      service.fetch_and_cache
      product.reload
      expect(product.cache.response['results'][0]['model']).to eq('iphone 2')
    end
  end
end
