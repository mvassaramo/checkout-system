require_relative '../lib/checkout'

RSpec.describe Checkout do

  subject(:checkout) { Checkout.new(promotional_rules) }

  describe '#scan' do
    it 'successfully adds the item to the basket if it is valid' do
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