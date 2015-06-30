# checkout.rb
require_relative 'product'

class Checkout
  
  PRICING_RULES = %w(2x1 gt3)

  def initialize(pricing_rules = PRICING_RULES)
    @rules  = pricing_rules
    @basket = []
  end

  def scan(code)
    @basket << Product.new(code)
  end

  def total
    apply_rules
    @basket.inject(0){ |result, item| result + (item.price - item.discount) }
  end


  private

  def apply_rules
    @rules.each do |rule|
      offer_products = @basket.select{ |item| item.offer == rule }
      if rule == '2x1'
        rule_2x1(offer_products)
      elsif rule == 'gt3'
        rule_gt3(offer_products)
      end
    end
  end

  def rule_2x1(offer_products)
    offer_products.each_with_index{ |item, i|
      item.discount = item.price if i.odd?
    }
  end

  def rule_gt3(offer_products)
    if offer_products.size >= 3
      offer_products.each{ |item| item.discount = 0.50 }
    end
  end
end
