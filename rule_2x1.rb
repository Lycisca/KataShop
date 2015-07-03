# rule_2x1
class Rule_2x1

  attr_reader :product_code

  def initialize(product_code)
    @product_code = product_code
  end

  def apply(offer_products)
    offer_products.each_with_index{ |item, i|
      item.discount = item.price if i.odd?
    }
  end
end
