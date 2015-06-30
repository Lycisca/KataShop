# product.rb
require 'yaml'

class Product
  
  PRODUCTS = YAML.load(File.open('products.yml'))
  
  attr_reader :code, :price, :description, :offer
  attr_accessor :discount
  
  def initialize(code)
    @code         = code
    @description  = get_description(code)
    @price        = get_price(code)
    @discount     = 0
    @offer        = get_offer(code)
  end


  private

  def get_price(code)
    PRODUCTS[code][:price]
  end

  def get_description(code)
    PRODUCTS[code][:description]
  end

  def get_offer(code)
    PRODUCTS[code][:offer]
  end
end
