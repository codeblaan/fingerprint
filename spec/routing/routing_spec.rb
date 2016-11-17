require 'rails_helper'

RSpec.describe 'routing' do
  it 'routes root (/) to the products controller' do
    expect(get('/')).to route_to('products#index');
  end

  it 'routes /products to the products controller' do
    expect(get('/products')).to route_to('products#index');
  end
end
