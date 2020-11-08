class Promotion

  def initialize(type:, discount_percentage:, item_code: nil, min_quantity: nil, threshold: nil)
    @type = type
    @discount_percentage = discount_percentage
    @item_code = item_code
    @min_quantity = min_quantity
    @threshold = threshold
  end
end