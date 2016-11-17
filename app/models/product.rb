class Product < ApplicationRecord
  has_many :semantics_caches

  def cache
    semantics_caches.last
  end
end
