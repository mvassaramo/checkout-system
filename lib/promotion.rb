class Promotion

  attr_reader :type, :discount_percentage, :threshold

  @@all = []

  def initialize(type:, discount_percentage:, item_code: nil, min_quantity: nil, threshold: nil)
    @type = type
    @discount_percentage = discount_percentage
    @item_code = item_code
    @min_quantity = min_quantity
    @threshold = threshold
    @@all << self
  end

  def self.apply_basket_discount(total)
    discount = basket_qualify_for_discount?(total)
    discount ? discount : 0
  end

  private

  def self.basket_qualify_for_discount?(total)
    basket_promos = all.select { |promo| promo.type == 'basket' }
    basket_promos.find { |promo| promo.threshold <= total }&.discount_percentage
  end

  def self.all
    @@all
  end
end