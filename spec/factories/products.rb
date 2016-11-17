FactoryGirl.define do
  factory :iphone, class: Product do
    name 'iphone'

    trait :with_cache do
      after(:create) do |product, _|
        FactoryGirl.create(:iphone_cache, product: product)
      end
    end

    trait :with_no_cache do
      after(:create) do |product, _|
        product.semantics_caches.delete_all
      end
    end
  end
end
