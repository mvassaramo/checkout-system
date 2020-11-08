class Promotion

  attr_reader :type, :discount_percentage, :threshold, :item_code, :min_quantity

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

  def self.apply_item_discount(item_code, quantity)
    discount = item_qualify_for_discount?(item_code, quantity) 
    discount ? discount : 0
  end

  private

  def self.basket_qualify_for_discount?(total)
    basket_promos = filter_promotions('basket')
    basket_promos.find { |promo| promo.threshold <= total }&.discount_percentage
  end

  def self.item_qualify_for_discount?(item_code, quantity)
    item_promos = filter_promotions('item')
    item_promos.find { |promo| promo.item_code == item_code && promo.min_quantity <= quantity}&.discount_percentage
  end

  def self.filter_promotions(type)
    all.select { |promo| promo.type == type }
  end

  def self.all
    @@all
  end
end