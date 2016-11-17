require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many :semantics_caches }

  describe '#cache' do
    context 'with no saved cache' do
      it 'returns nil' do
        product = FactoryGirl.create(:iphone, :with_no_cache)
        expect(product.cache).to eq(nil)
      end
    end

    context 'with saved cache' do
      it 'returns the cache' do
        product = FactoryGirl.create(:iphone, :with_cache)
        expect(product.cache).to be_a(SemanticsCache)
      end
    end
  end
end
