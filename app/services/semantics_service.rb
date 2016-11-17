class SemanticsService
  API_KEY = 'SEM3A432BE10B8357242CE828731AA4A19C5'
  API_SECRET = 'MjIxMTBiMTAyMjE3Nzk0OWJiODJkNzAyNGYzMzNiNjQ'

  def initialize(product)
    @product = product
    @response = nil
  end

  def search
    if cached?
      @response = @product.cache.response
    else
      sem3.products_field('search', @product.name)
      @response = sem3.get_products
      cache_response
    end
    @response || {}
  end

  def sem3
    @sem3 ||= Semantics3::Products.new(API_KEY, API_SECRET)
  end

  private

  def cached?
    @product.cache.present?
  end

  def cache_response
    if @response && @response['code'] == 'OK'
      SemanticsCache.create(product: @product, response: @response)
    end
  end
end
