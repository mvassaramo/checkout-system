require_relative '../lib/checkout'

RSpec.describe Checkout do

  subject(:checkout) { Checkout.new(promotional_rules) }

  let(:promotional_rules) do
    [
      { type: 'item', discount_percentage: 0.75/9.25, item_code: 001, min_quantity: 2, threshold: nil },
      { type: 'basket', discount_percentage: 0.1 , item_code: nil, min_quantity: nil, threshold: 60.00 },
    ]
  end

  let(:item1) { Item.new(code: 001, name: 'Very Cheap Chair', price: 9.25) }
  let(:item2) { Item.new(code: 002, name: 'Little Table', price: 45.00) }
  let(:item3) { Item.new(code: 003, name: 'Funky Light', price: 19.95) }

  describe '#scan' do
    it 'successfully adds the item to the basket if it is valid' do
      checkout.scan(item1)
      expect((checkout.basket).count).to eq 1
    end

    it 'increases the quantity by 1 if item is already in basket' do
    end
  end

  describe '#total' do
    it 'is 0 if the basket is empty' do
    end

    it 'applies basket discount if above £60' do
    end

    it 'applies discount for items with promotion' do
    end

    it 'applies both item and basket discount' do
    end
  end
end