# rule 3gt
class Rule_3gt

  attr_reader :product_code

  def initialize(product_code, quantity, discount)
    @product_code, @quantity, @discount = product_code, quantity, discount
  end
    
  def apply(offer_products)
    if offer_products.size >= @quantity
      offer_products.each{ |item| item.discount = @discount }
    end
  end
end
