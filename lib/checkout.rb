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

    # check if basket has item
    item_found = basket_has_item(item)

    if item_found
      item_found[:quantity] += 1
    else
      @basket << { code: item.code, price: item.price, quantity: 1 }
    end
  end

  private 

  def create_promotions(promotional_rules)
    return if !promotional_rules
    promotional_rules.each { |promo| Promotion.new(promo) }
  end

  def basket_has_item(item)
    false
    # TODO: implement
  end
end