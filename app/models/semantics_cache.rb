class SemanticsCache < ApplicationRecord
  serialize :response
  belongs_to :product
end
