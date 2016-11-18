class Product < ApplicationRecord
  has_many :semantics_caches
  validates :name, presence: true, uniqueness: true

  def cache
    semantics_caches.last
  end
end
