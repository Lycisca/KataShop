# checkout.rb
require_relative 'product'
require_relative 'rule_3gt'
require_relative 'rule_2x1'

class Checkout
  
  PRICING_RULES = [Rule_2x1.new('AM'), Rule_3gt.new('AC', 3, 0.50)]
  
  def initialize(pricing_rules = PRICING_RULES)
    @rules  = pricing_rules
    @basket = []
  end

  def scan(code)
    @basket << Product.new(code)
  end

  def total
    apply_rules
    @basket.inject(0){ |result, item| result + (item.price_with_discount) }
  end


  private

  def apply_rules
    @rules.each do |rule|
      offer_products = @basket.select{ |item| item.code == rule.product_code }
      rule.apply(offer_products)  
    end
  end
end
