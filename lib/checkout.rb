require_relative 'item'
require_relative 'promotion'

class Checkout
  
  attr_reader :basket

  def initialize(promotional_rules)
    @basket = []
    create_promotions(promotional_rules)
  end

  def scan(item)
    # check if valid
    item_found = basket_has_item(item)

    if item_found
      item_found[:quantity] += 1
    else
      @basket << { code: item.code, price: item.price, quantity: 1 }
    end
  end

  def total
    return 0 if @basket.empty?

    item_discounted_total = @basket.reduce(0) do |sum, item|
      discount = Promotion.apply_item_discount(item[:code], item[:quantity])

      item_cost_with_discount = (1 - discount) * item[:price] * item[:quantity]
      
      sum + item_cost_with_discount
    end

    basket_discount = Promotion.apply_basket_discount(item_discounted_total)

    total = (item_discounted_total * (1 - basket_discount)).round(2)
  end

  private 

  def create_promotions(promotional_rules)
    return if !promotional_rules
    promotional_rules.each { |promo| Promotion.new(promo) }
  end

  def basket_has_item(item)
    @basket.find { |i| i[:code] ==item.code }
  end
end