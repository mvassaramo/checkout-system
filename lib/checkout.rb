require_relative 'item'
require_relative 'promotion'

class Checkout
  def initialize(promotional_rules)
    @basket = []
    create_promotions(promotional_rules)
  end

  private 

  def create_promotions(promotional_rules)
    return if !promotional_rules
    promotional_rules.each { |promo| Promotion.new(promo) }
  end
end