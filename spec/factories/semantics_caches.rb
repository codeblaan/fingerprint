FactoryGirl.define do
  factory :iphone_cache, class: SemanticsCache do
    response { {
      'code' => 'OK',
      'results' => [{
        'model' => 'iphone 1',
        'price' => '700',
        'price_currency' => 'USD'
      }, {
        'model' => 'iphone 2',
        'price' => '800',
        'price_currency' => 'USD'
      }, {
        'model' => 'iphone 3',
        'price' => '900',
        'price_currency' => 'USD'
      }]
    } }
  end
end
